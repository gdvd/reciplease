//
//  ResponseHits.swift
//  reciplease
//
//  Created by Gilles David on 25/01/2022.
//

import Foundation

struct ResponseHit: Codable {
    
    init(recipe: ResponseRecipe){
        self.recipe = recipe
    }
    var recipe: ResponseRecipe
}
