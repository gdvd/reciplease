//
//  ListRecipeModel.swift
//  reciplease
//
//  Created by Gilles David on 28/01/2022.
//

import Foundation

class ListRecipeModel {
    
    
    
    public static let shared = ListRecipeModel()
    private init() {}
    
}
/*private func AddRecipe() {
    let recipe = RecipeDB(context: AppDelegate.viewContext)
    recipe.label = "azerty"
    do {
        try? AppDelegate.viewContext.save()
    } catch(let error) {
        print(error.localizedDescription)
    }
}

private func loadData() {
    let request: NSFetchRequest<RecipeDB> = RecipeDB.fetchRequest()
    guard let recipes = try? AppDelegate.viewContext.fetch(request) else {
        return
    }
    for recipe in recipes {
        
    }
}*/
