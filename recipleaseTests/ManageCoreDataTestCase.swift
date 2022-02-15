//
//  ManageCoreDataTestCase.swift
//  recipleaseTests
//
//  Created by Gilles David on 14/02/2022.
//

import XCTest
import CoreData
@testable import reciplease

class ManageCoreDataTestCase: XCTestCase {

    let coredata = ManageCoreData.shared
    let context = AppDelegate.viewContext 
    
    
    // getAllRecipeToShowWhenFavoriteIsTrue()  -> [RecipeToShow]
    func testGetallrecipetoshowwhenfavoriteistrueGivenOnerecipeShouldOnerecipeatleast() {
        // If one Recipe with idRecipe = "1" exist -> test false
        if !ifIdRecipeWithExist(idRecipe: "1"){
            addNewRecipe(withId: "1", favorite: true)
            let listRecipe2Shhow = coredata.getAllRecipeToShowWhenFavoriteIsTrue()
            XCTAssert(listRecipe2Shhow.count >= 1)

            // If one Recipe with idRecipe = "1" exist
            let res = listRecipe2Shhow.filter { $0.idRecipe  == "1" }
            XCTAssert(!res.isEmpty)
            
            // delete Recipe with idRecipe = "1"
            deleteOneRecipeWithId(idRecipe: "1")
            XCTAssertFalse(ifIdRecipeWithExist(idRecipe: "1"))
        } else {
            XCTAssert(false)
        }
    }
    
    // getOneRecipeToShow(withId: String) -> RecipeToShow?
    func testGetOneRecipeToShowGivenOnerecipeShouldOnerecipeat() {
        // If one Recipe with idRecipe = "2" exist -> test false
        if !ifIdRecipeWithExist(idRecipe: "2"){
            addNewRecipe(withId: "2", favorite: false)
            
            let recipe2Show = coredata.getOneRecipeToShow(withId: "2")
            
            // If one Recipe with idRecipe = "2" exist
            XCTAssert(recipe2Show != nil)
            
            // delete Recipe with idRecipe = "1"
            deleteOneRecipeWithId(idRecipe: "2")
            XCTAssertFalse(ifIdRecipeWithExist(idRecipe: "2"))
        } else {
            XCTAssert(false)
        }
    }
    
    func testGetOneRecipeToShowGivenFalseidShouldNil() {
        // If one Recipe with idRecipe = "2" exist -> test false
        XCTAssertNil(coredata.getOneRecipeToShow(withId: "AZERTY"))
    }
    
    // setValueForFavorite(idRecipe: String, favorite: Bool) -> Bool
    func testSetvalueforfavoriteWhenfavoritechangeShouldChange() {
        // If one Recipe with idRecipe = "3" exist -> test false
        if !ifIdRecipeWithExist(idRecipe: "3"){
            addNewRecipe(withId: "3", favorite: false)
            let recipe2Show = coredata.getOneRecipeToShow(withId: "3")
            // If one Recipe with idRecipe = "3" exist
            XCTAssert(recipe2Show != nil)
            
            XCTAssert(coredata.setValueForFavorite(idRecipe: recipe2Show!.idRecipe, favorite: true))
            
            let recipe2Show2 = coredata.getOneRecipeToShow(withId: "3")
            // If one Recipe with idRecipe = "3" exist
            XCTAssert(recipe2Show2 != nil)
            // If favorite is already true
            XCTAssert(recipe2Show2!.favorite)
            
            // delete Recipe with idRecipe = "1"
            deleteOneRecipeWithId(idRecipe: "3")
            XCTAssertFalse(ifIdRecipeWithExist(idRecipe: "3"))
        } else {
            XCTAssert(false)
        }
    }
    
    func testSetvalueforfavoriteWhenIdDoesntExistShouldFalse() {
        XCTAssertFalse(coredata.setValueForFavorite(idRecipe: "AZERTY", favorite: true))
    }
    
    // saveInDB(recipesInHits: [ResponseHit]) -> [String]
    func testSaveindbGivenResponseHitShouldIds() {
        
        var resp:ResponseRequest!
        let bundle = Bundle(for: ManageCoreDataTestCase.self)
        let url = bundle.url(forResource: "requestBeefTwoResponseLight", withExtension: "json")
        // ID Used : 123Test1 AND 123Test2 IN requestBeefTwoResponseLight.json
        if let data = try? Data(contentsOf: url!) {
            guard let responseJSON = try? JSONDecoder().decode(ResponseRequest.self, from: data) else{
                return
            }
            resp = responseJSON
            XCTAssertEqual(resp.hits.count, 2)
            
            let idsRecipeFromJson = coredata.saveInDB(recipesInHits: resp.hits)
            // If fonction saveInDB return corect ids
            XCTAssertEqual(idsRecipeFromJson[0], "123Test1")
            XCTAssertEqual(idsRecipeFromJson[1], "123Test2")
            
            let recipe2Show123Test1 = coredata.getOneRecipeToShow(withId: "123Test1")
            // If one Recipe with idRecipe = "123Test1" exist
            XCTAssert(recipe2Show123Test1 != nil)
            let recipe2Show123Test2 = coredata.getOneRecipeToShow(withId: "123Test2")
            // If one Recipe with idRecipe = "123Test2" exist
            XCTAssert(recipe2Show123Test2 != nil)
            
            // delete Recipe with idRecipe = "123Test1"
            deleteOneRecipeWithId(idRecipe: "123Test1")
            XCTAssertFalse(ifIdRecipeWithExist(idRecipe: "123Test1"))
            // delete Recipe with idRecipe = "123Test2"
            deleteOneRecipeWithId(idRecipe: "123Test2")
            XCTAssertFalse(ifIdRecipeWithExist(idRecipe: "123Test2"))
        } else {
            XCTAssert(false)
        }
        
    }

    
    // getidRecipe(urlRecipe: String) -> String
    func testGetidrecipeGivenUriShould123456789() {
        let uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_123456789"
        let res = coredata.getidRecipe(urlRecipe: uri)
        XCTAssertEqual(res, "123456789")
    }
    
    func testGetidrecipeGivenIncorectUriShouldEmptyString() {
        let uri = "http://www.edamam.com/ontologies/edamam.owlAZERTY"
        let res = coredata.getidRecipe(urlRecipe: uri)
        XCTAssertEqual(res, "")
    }
    
    ////////////////////////////// Tools 4 test ///////////////////////////
    fileprivate func ifIdRecipeWithExist(idRecipe: String) -> Bool {
        let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        request.predicate = NSPredicate(format: "idRecipe == %@", idRecipe)
        return (try! context.fetch(request)).count != 0
    }
    
    fileprivate func getOneRecipe(idRecipe: String) ->Recipe? {
        let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        request.predicate = NSPredicate(format: "idRecipe == %@", idRecipe)
        return (try! context.fetch(request))[0]
    }
    
    fileprivate func addNewRecipe(withId: String, favorite: Bool) {
        let newRecipe = Recipe(context: context)
        newRecipe.idRecipe = withId
        newRecipe.favorite = favorite
        newRecipe.label = "label"
        newRecipe.duration = 0
        newRecipe.urlApi = "urlApi"
        newRecipe.urlSrc = "urlSrc"
        newRecipe.yield = 1
        do {
            try context.save()
        } catch let error {
            print("***> ",error.localizedDescription)
        }
    }
    
    fileprivate func deleteOneRecipeWithId(idRecipe: String) {
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipe")
        deleteFetch.predicate = NSPredicate(format: "idRecipe == %@", idRecipe)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
    }
}
