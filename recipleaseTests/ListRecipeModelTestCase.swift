//
//  ResultRecipesTestCase.swift
//  recipleaseTests
//
//  Created by Gilles David on 11/02/2022.
//

import XCTest
@testable import reciplease

class ListRecipeModelTestCase: XCTestCase {
    
    func testSearchrecipesGivenkeyword0123ShouldResultIsZerohit(){
        
        let recipeToShow = RecipeToShow(idRecipe: "", label: "String", yield: "1", duration: "1", ingredients: [], ingredientWithDetails: [], urlApi: "urlApi", urlSrc: "urlSrc", favorite: true)
        
        let downloadService = FakeDownloadService(isCase: .resultZeroRecipe)
        let manageCoreData = FakeManageCoreData(isCase: .success, recipeToShow: recipeToShow)
        
        let listRecipeModel = ListRecipeModel(downloadService: downloadService, manageCoreData: manageCoreData)
        
        listRecipeModel.searchRecipes(tblStringRequest: ["String"]) { tblRecipeToShow in
            switch tblRecipeToShow {
            case .Success(_):
                XCTAssert(false)
            case .Failure(_):
                XCTAssert(false)
            case .Zero:
                XCTAssert(true)
            }
        }
    }
    
    func testSearchrecipesGivenkeywordBeefShouldResultarecipes(){
        
        let recipeToShow = RecipeToShow(idRecipe: "", label: "String", yield: "1", duration: "1", ingredients: [], ingredientWithDetails: [], urlApi: "urlApi", urlSrc: "urlSrc", favorite: true)
        
        let downloadService = FakeDownloadService(isCase: .success)
        let manageCoreData = FakeManageCoreData(isCase: .success, recipeToShow: recipeToShow)
        
        let listRecipeModel = ListRecipeModel(downloadService: downloadService, manageCoreData: manageCoreData)
        
        listRecipeModel.searchRecipes(tblStringRequest: ["String"]) { tblRecipeToShow in
            switch tblRecipeToShow {
            case .Success(let recipe2Show):
                XCTAssertEqual(recipe2Show[0].idRecipe, "123Test1")
                XCTAssertEqual(recipe2Show[1].idRecipe, "123Test2")
            case .Failure(failure: _):
                XCTAssert(false)
            case .Zero:
                XCTAssert(false)
            }
        }
    }
    
    
    func testSearchoneimagewhenDataIsGoodGivenSuccessRespone(){
        
        let downloadService = FakeDownloadService(isCase: .success)
        let favoriteModel = FavoriteModel(downloadService: downloadService)
        
        favoriteModel.searchOneImage(url: "") {
            result in 
            switch result {
            case .Success(response: let image):
                let img = UIImage(named: "cooking.png")
                XCTAssertEqual(image.description, img!.description)
            case .Failure(failure: _):
                XCTAssert(false)
            }
        }
    }
    
    func testSearchoneimagewhenDataIsBadGivenFailureRespone(){
        
        let downloadService = FakeDownloadService(isCase: .failure)
        let favoriteModel = FavoriteModel(downloadService: downloadService)
        
        favoriteModel.searchOneImage(url: "") {
            result in 
            switch result {
            case .Success(response: _):
                XCTAssert(false)
            case .Failure(failure: _):
                XCTAssert(true)
            }
        }
    }


}
