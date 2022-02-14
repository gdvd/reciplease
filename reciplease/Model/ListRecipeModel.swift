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
    private var manageCoreData = ManageCoreData.shared
    
    // 4 XCTest
    convenience init(downloadService: DownloadService, manageCoreData: ManageCoreData ) {
        self.init()
        self.downloadService = downloadService
        self.manageCoreData = manageCoreData
    }
    
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
    
    public func searchRecipes(tblStringRequest: [String], completionHandler: @escaping (ResultRecipes) -> Void) {
        let query = tblStringRequest.joined(separator: ",")
        let queryEncoded = query.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed)!
        let urlApi = Constants.urlApiEdamam.replacingOccurrences(of: Constants.textQueryPattern, with: queryEncoded)
        var tblIdRecipe: [String] = []
        downloadService.downloadRecipes(url: urlApi) { [self]  result in
            switch result {
            case .Success(response: let resp):
                if resp.hits.count > 0 {
                    tblIdRecipe = manageCoreData.saveInDB(recipesInHits: resp.hits)
                    let tblRecipeToShow = getListRecipeToShowWithIdRecipe(tblIdRecipe: tblIdRecipe)
                    completionHandler(.Success(response: tblRecipeToShow))
                    
                } else {
                    completionHandler(.Zero)
                }
            case .Failure(failure: let error):
                completionHandler(ResultRecipes.Failure(failure: error))
            }
        }
    }
    
    private func getListRecipeToShowWithIdRecipe(tblIdRecipe: [String]) -> [RecipeToShow] {
        var tblRecipeToShow: [RecipeToShow] = []
        for idRecipe in tblIdRecipe {
            if let recipeToShow = manageCoreData.getOneRecipeToShow(withId: idRecipe) {
                tblRecipeToShow.append(recipeToShow)
            }
        }
        return tblRecipeToShow
    }

}
