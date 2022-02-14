//
//  FakeManageCoreData.swift
//  recipleaseTests
//
//  Created by Gilles David on 13/02/2022.
//

import Foundation
import UIKit
@testable import reciplease

class FakeManageCoreData: ManageCoreData {
    
    enum WitchCase {
        case success
        case failure
    }
    var isCase: WitchCase!
    var recipeToShow: RecipeToShow!
    
    init(isCase: WitchCase) { 
        super.init() 
        self.isCase = isCase
    }
    init(isCase: WitchCase, recipeToShow: RecipeToShow) { 
        super.init() 
        self.isCase = isCase
        self.recipeToShow = recipeToShow
    }
    
    override func saveInDB(recipesInHits: [ResponseHit]) -> [String] {
        var tblIdRecipe: [String] = []
        for recipeInHit in recipesInHits {
            if let uriStr = recipeInHit.recipe.uri {
                let idRecipe = getidRecipe(urlRecipe: uriStr)
                tblIdRecipe.append(idRecipe)
            }
        }
        return tblIdRecipe
    }
    
    override func getOneRecipeToShow(withId: String) -> RecipeToShow? {
        recipeToShow.idRecipe = withId
        return recipeToShow
    }
    
    
}
