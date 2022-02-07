//
//  SaveObjectToDB.swift
//  reciplease
//
//  Created by Gilles David on 01/02/2022.
//

import Foundation
import CoreData

class SaveObjectToDB {
    
    public static let shared = SaveObjectToDB()
    private init() {}
    
    private let context = AppDelegate.viewContext
    
    func resetAllRecords(in entity : String) {// entity = Your_Entity_Name 
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do
        {
            try context.execute(deleteRequest)
            try context.save()
        }
        catch
        {
            print ("There was an error")
        }
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
    
    private func getidRecipe(urlRecipe: String) -> String {
        if let idStr = urlRecipe.split(separator: "_").last {
            return String(idStr)
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
    
    private func addNewRecipe(recipe: ResponseRecipe, idRecipe: String) -> Recipe? {
//        print("id '\(idRecipe)' label '\(recipe.label)' duration '\(recipe.totalTime.description)'\n")
        let newRecipe = Recipe(context: context)
        newRecipe.idRecipe = idRecipe
        newRecipe.favorite = false
        newRecipe.label = recipe.label
        newRecipe.duration = Int16(recipe.totalTime)
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
