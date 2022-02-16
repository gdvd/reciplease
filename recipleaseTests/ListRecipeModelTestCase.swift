//
//  ResultRecipesTestCase.swift
//  recipleaseTests
//
//  Created by Gilles David on 11/02/2022.
//

import XCTest
@testable import reciplease

class ListRecipeModelTestCase: XCTestCase {
    
    
    
    func testSearchrecipesWhenfailurenetworkGivenkeyword0123ShouldResultIsFailure(){
        
        let recipeToShow = RecipeToShow(idRecipe: "", label: "String", yield: "1", duration: "1", ingredients: [], ingredientWithDetails: [], urlApi: "urlApi", urlSrc: "urlSrc", favorite: true)
        
        let downloadService = FakeDownloadService(isCase: .failure)
        let manageCoreData = FakeManageCoreData(isCase: .success, recipeToShow: recipeToShow)
        
        let listRecipeModel = ListRecipeModel(downloadService: downloadService, manageCoreData: manageCoreData)
        
        listRecipeModel.searchRecipes(tblStringRequest: ["String"]) { tblRecipeToShow in
            switch tblRecipeToShow {
            case .Success(_):
                XCTAssert(false)
            case .Failure(_):
                XCTAssert(true)
            case .Zero:
                XCTAssert(false)
            }
        }
    }
    
    
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
        let recipeToShow = RecipeToShow(idRecipe: "", label: "String", yield: "1", duration: "1", ingredients: [], ingredientWithDetails: [], urlApi: "urlApi", urlSrc: "urlSrc", favorite: true)
        let downloadService = FakeDownloadService(isCase: .success)
        let manageCoreData = FakeManageCoreData(isCase: .success, recipeToShow: recipeToShow)
        let listRecipeModel = ListRecipeModel(downloadService: downloadService, manageCoreData: manageCoreData)
        
        listRecipeModel.searchOneImage(url: "") {
            result in 
            switch result {
            case .Success(response: let dataImg):
                let imgRef = UIImage(named: "cooking.png")
                let img = UIImage(data: dataImg)
                XCTAssertEqual(imgRef?.size, img?.size)
                
            case .Failure(failure: _):
                XCTAssert(false)
            }
        }
    }
    
    func testSearchoneimagewhenDataIsBadGivenFailureRespone(){
        let recipeToShow = RecipeToShow(idRecipe: "", label: "String", yield: "1", duration: "1", ingredients: [], ingredientWithDetails: [], urlApi: "urlApi", urlSrc: "urlSrc", favorite: true)
        let downloadService = FakeDownloadService(isCase: .failure)
        let manageCoreData = FakeManageCoreData(isCase: .success, recipeToShow: recipeToShow)
        let listRecipeModel = ListRecipeModel(downloadService: downloadService, manageCoreData: manageCoreData)
        
        listRecipeModel.searchOneImage(url: "") {
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
