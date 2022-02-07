//
//  ListRecipeModel.swift
//  reciplease
//
//  Created by Gilles David on 28/01/2022.
//

import Foundation
import CoreData
import UIKit

enum ResultRecipes {
    case Success(response: [RecipeToShow])
    case Zero
    case Failure(failure: RequestError)
}

class ListRecipeModel {
    
    public static let shared = ListRecipeModel()
    private init() {}
    
    private var downloadService = DownloadService.shared
    private let saveObjectToDB = SaveObjectToDB.shared
    
    private var oneFileManager = OneFileManager()
    
    public func searchOneImage(url: String, completionHandler: @escaping (ResultImage) -> Void) {
        downloadService.downloadImage(url: url) { resultImage in
            switch resultImage {
            case .Success(response: let img):
                completionHandler(.Success(response: img))
            case .Failure(failure: let error):
                completionHandler(ResultImage.Failure(failure: error))
            }
        }
    }
    
    func searchRecipes(tblStringRequest: [String], completionHandler: @escaping (ResultRecipes) -> Void) {
        let query = tblStringRequest.joined(separator: ",")
        let queryEncoded = query.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed)!
        let urlApi = Constants.urlApiEdamam.replacingOccurrences(of: Constants.textQueryPattern, with: queryEncoded)
        var tblIdRecipe: [String] = []
        downloadService.downloadRecipes(url: urlApi) { [self]  result in
            switch result {
            case .Success(response: let resp):
                if resp.hits.count > 0 {
                    tblIdRecipe = saveObjectToDB.saveInDB(recipesInHits: resp.hits)
                    var tblRecipeToShow: [RecipeToShow] = []
                    for idRecipe in tblIdRecipe {
                        if let recipeToShow = getOneRecipeToShow(withId: idRecipe) {
                            tblRecipeToShow.append(recipeToShow)
                        }
                    }
                    completionHandler(.Success(response: tblRecipeToShow))
                    
                } else {
                    completionHandler(.Zero)
                }
            case .Failure(failure: let error):
                completionHandler(ResultRecipes.Failure(failure: error))
            }
        }
    }
    
    private func getOneRecipeToShow(withId: String) -> RecipeToShow? {
        
        var recipeToShow: RecipeToShow?
        let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        request.predicate = NSPredicate(format: "idRecipe == %@", withId)
        
        if let recipe1 = try? AppDelegate.viewContext.fetch(request)[0] {
            
            var ingredients: [String] = []
            var ingredientWithDetails: [String] = []
            
            if let rec2in = recipe1.recipe2ing {
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
            
            recipeToShow = RecipeToShow(idRecipe: recipe1.idRecipe!, label: recipe1.label!, yield: recipe1.yield.description, duration: recipe1.duration.description, ingredients: ingredients, ingredientWithDetails: ingredientWithDetails)
            
                // Make the best choice of image size, with sort in "sortImg" 
                var tblUrlImgSorted: [String] = []
                SizeImgRecipe.allCases.forEach { enumSizeImg in 
                    if let imgs = recipe1.images {
                        for img in imgs {
                            let im = img as! Image
                            if im.name! == enumSizeImg.rawValue {
                                tblUrlImgSorted.append(im.url!.description)
                                break
                            }
                        }
                    }
                }
            recipeToShow!.images = tblUrlImgSorted
        }
        return recipeToShow
    }
    
    
    private func getImageFromUrl(url: String) -> UIImage? {
        //TODO: GetImageFromUrl
        return nil
    }
    
//    func getData(tblStringRequest: [String]) -> ResponseRequest?{
//        //let query = tblStringRequest.joined(separator: ", ")
//        print("searchRecipes ok, data is in document path", oneFileManager.ifFileExist(fileName: "beefp1.json"))
//        if oneFileManager.ifFileExist(fileName: "beefp1.json") {
//            guard let data = oneFileManager.loadItems(fileName: "beefp1.json") else {
//                print("********* decode error")
//                return nil
//            }
//            print("======> decode success")
//            return data
//        }
//           return nil 
//    }
}
