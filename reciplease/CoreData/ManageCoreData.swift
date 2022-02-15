//
//  SaveObjectToDB.swift
//  reciplease
//
//  Created by Gilles David on 01/02/2022.
//

import CoreData

class ManageCoreData {
    
    public static let shared = ManageCoreData()
    init() {}
    
    private let context = AppDelegate.viewContext
    
    public func getAllRecipeToShowWhenFavoriteIsTrue()  -> [RecipeToShow] {
        var listRecipeToShow: [RecipeToShow] = []
        
        let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        //request.predicate = NSPredicate(format: "favorite == %@", 1)
        request.predicate = NSPredicate(format: "favorite = %d", true)
        //request.predicate = NSPredicate(format: "boolAttribute == %@", NSNumber(value: true))
        
        if let recipes = try? AppDelegate.viewContext.fetch(request) {
            for recipe in recipes {
                listRecipeToShow.append(recipeToRecipetoshow(recipe: recipe))
            }
        }
        return listRecipeToShow
    }
    
    public func getOneRecipeToShow(withId: String) -> RecipeToShow? {
        let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        request.predicate = NSPredicate(format: "idRecipe == %@", withId)
        let rec = try? AppDelegate.viewContext.fetch(request)
        if let recipe = rec, rec!.count != 0 {
            return recipeToRecipetoshow(recipe: recipe[0])
        } else {
            return nil
        }
    }
    
    public func setValueForFavorite(idRecipe: String, favorite: Bool) -> Bool {
        let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        request.predicate = NSPredicate(format: "idRecipe == %@", idRecipe)
        
        let rec = try? AppDelegate.viewContext.fetch(request)
        if let recipe = rec, rec!.count != 0 {
            recipe[0].favorite = favorite
            //recipe.setValue(true, forKey: "favorite")
            do {
                try context.save()
            }
            catch {
                print("error db", error)
                return false
            }
            return true
        }     
        return false
    }
    
    public func saveInDB(recipesInHits: [ResponseHit]) -> [String] {
        var tblIdRecipe: [String] = []
        for recipeInHit in recipesInHits {
            if let uriStr = recipeInHit.recipe.uri {
                let idRecipe = getidRecipe(urlRecipe: uriStr)
                if !ifIdRecipeExistInDB(idRecipe: idRecipe){
                    // Create new recipe in DB
                    if let recipe = addNewRecipe(recipe: recipeInHit.recipe, idRecipe: idRecipe) {
                         // Continued if the first part worked
                        saveImagesOfRecipe(recipe: recipe, images: recipeInHit.recipe.images)
                        saveIngredientsOfRecipe(recipe: recipe, ingredients: recipeInHit.recipe.ingredients)
                        
                    }
                }
                tblIdRecipe.append(idRecipe)
            }
        }
        return tblIdRecipe
    }
    
    public func getidRecipe(urlRecipe: String) -> String {
        let idStr: [String] = urlRecipe.components(separatedBy: "_")
        if idStr.count > 1 {
            return idStr[idStr.count-1]
        } else {
            return ""
        }
    }
    
    private func ifIdRecipeExistInDB(idRecipe: String) -> Bool{
        if idRecipe != "" {
            let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
            request.predicate = NSPredicate(format: "idRecipe == %@", idRecipe)
            let res = try? context.fetch(request)
            // If this recipe(idRecipe) exist in DB ? -> return Bool
            return res != nil && res != []
        } else {
            return false
        }
    }
    
    private func recipeToRecipetoshow(recipe: Recipe) -> RecipeToShow {
        
        var ingredients: [String] = []
        var ingredientWithDetails: [String] = []
        
        if let rec2in = recipe.recipe2ing {
            for r2c in rec2in {
                let ri = r2c as! Recipe2Ingredient
                if let r1 = ri.rec2recipe!.food {
                    ingredients.append(r1)
                }
                if let r2 = ri.text {
                    ingredientWithDetails.append(r2)
                }
                // let qt = ri.quantity // 1.0
                // let we = ri.weight // 28.0
                // let me = (ri.rec2recipe!.measure ?? "") as String
                //                  // OPTIONAL : cup/<unit>/gram...
            }
        }
        
        var recipeToShow = RecipeToShow(idRecipe: recipe.idRecipe!, label: recipe.label!, yield: recipe.yield.description, duration: recipe.duration.description, ingredients: ingredients, ingredientWithDetails: ingredientWithDetails, urlApi: recipe.urlApi!, urlSrc: recipe.urlSrc!, favorite: recipe.favorite)
        
            // Make the best choice of image size, with sort in "sortImg" 
            var tblUrlImgSorted: [String] = []
            SizeImgRecipe.allCases.forEach { enumSizeImg in 
                if let imgs = recipe.images {
                    for img in imgs {
                        let im = img as! Image
                        if im.name! == enumSizeImg.rawValue {
                            tblUrlImgSorted.append(im.url!.description)
                            break
                        }
                    }
                }
            }
        recipeToShow.images = tblUrlImgSorted
        return recipeToShow
    }
    
    private func addNewRecipe(recipe: ResponseRecipe, idRecipe: String) -> Recipe? {
        let newRecipe = Recipe(context: context)
        newRecipe.idRecipe = idRecipe
        newRecipe.favorite = false
        newRecipe.label = recipe.label
        newRecipe.duration = Int16(recipe.totalTime ?? 0)
        if let urlApi = recipe.shareAs {
            newRecipe.urlApi = urlApi
        } else {
            newRecipe.urlApi = ""
        }
        if let urlSrc = recipe.url {
            newRecipe.urlSrc = urlSrc
        } else {
            newRecipe.urlSrc = ""
        }
        if let yield = recipe.yield {
            newRecipe.yield = Int16(yield)
        } else {
            newRecipe.yield = 0
        }
        do {
            try context.save()
        } catch let error {
            print("***> ",error.localizedDescription)
            return nil
        }
        let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        request.predicate = NSPredicate(format: "idRecipe == %@", idRecipe)
        return (try! context.fetch(request))[0]
    }
    
    private func saveImageInDb(recipe: Recipe, image: ResponseImage, nameImg: String){
        let img = Image(context: context)
        img.recipe = recipe
        img.name = nameImg
        img.url = image.url
        img.height = Int16(image.height)
        img.width = Int16(image.width)
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func saveImagesOfRecipe(recipe: Recipe, images: ResponseImages) {
        if let thumbnail = images.thumbnail {
            saveImageInDb(recipe: recipe, image: thumbnail, nameImg: SizeImgRecipe.thumbnail.rawValue)
        }
        if let small = images.small {
            saveImageInDb(recipe: recipe, image: small, nameImg: SizeImgRecipe.small.rawValue)
        }
        if let regular = images.regular {
            saveImageInDb(recipe: recipe, image: regular, nameImg: SizeImgRecipe.regular.rawValue)
        }
        if let large = images.large {
            saveImageInDb(recipe: recipe, image: large, nameImg: SizeImgRecipe.large.rawValue)
        }
    }
    private func getIngredientWithId(foodId: String) -> Ingredient? {
        let request: NSFetchRequest<Ingredient> = Ingredient.fetchRequest()
        request.predicate = NSPredicate(format: "idIngredient == %@", foodId)
        var ingredientTbl: [Ingredient] = []
        do {
            ingredientTbl = try context.fetch(request)
        } catch let error {
            print(error.localizedDescription)
        }
        if ingredientTbl.isEmpty {
            return nil
        } else {
            return ingredientTbl[0]
        }
    }
    private func saveIngredient2Recipe(recipeDb: Recipe, ingredientDb: Ingredient, responseIngredient: ResonseIngredient ) {
        
        let recipe2Ingredient = Recipe2Ingredient(context: context)
        recipe2Ingredient.text = responseIngredient.text

        recipe2Ingredient.quantity = responseIngredient.quantity 
        if let weight =  responseIngredient.weight {
            recipe2Ingredient.weight = weight
        }
        recipe2Ingredient.ing2recipe = recipeDb
        recipe2Ingredient.rec2recipe = ingredientDb
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func saveIngredientsOfRecipe(recipe: Recipe, ingredients: [ResonseIngredient]){
        
        for ingredient in ingredients {
            if let ingredientDB = getIngredientWithId(foodId: ingredient.foodId) {
                // This ingredient was in DB, make link : ingredient with recipe
                saveIngredient2Recipe(recipeDb: recipe, ingredientDb: ingredientDB, responseIngredient: ingredient)
            } else {
                let newIngredient = Ingredient(context: context)
                newIngredient.food = ingredient.text
                newIngredient.idIngredient = ingredient.foodId
                if let measure = ingredient.measure {
                    newIngredient.measure = measure
                }
                do { 
                    // Save Ingredient in DB
                    try context.save()
                } catch let error {
                    print(error.localizedDescription)
                }
                if let ingredientDB2 = getIngredientWithId(foodId: ingredient.foodId){
                    // Now ingredient is DB, make link : ingredient with recipe
                    saveIngredient2Recipe(recipeDb: recipe, ingredientDb: ingredientDB2, responseIngredient: ingredient)
                }
            }
        }
    }
}
