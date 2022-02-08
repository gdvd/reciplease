//
//  DetailModel.swift
//  reciplease
//
//  Created by Gilles David on 07/02/2022.
//

import Foundation
import CoreData


class DetailModel {
    
    public static let shared = DetailModel()
    private init() {}
    
    private let manageCoreData = ManageCoreData.shared
    
    public func setValueForFavoriteInDb(idRecipe: String, favorite: Bool) -> Bool {
        return manageCoreData.setValueForFavorite(idRecipe: idRecipe, favorite: favorite)
    }
    
    public func getOneRecipe(idRecipe: String) -> RecipeToShow? {
        return manageCoreData.getOneRecipeToShow(withId: idRecipe)
    }
}
