//
//  ResponseRecipe.swift
//  reciplease
//
//  Created by Gilles David on 25/01/2022.
//

import Foundation


struct ResponseRecipe: Codable { 
    
    init(label: String, images: ResponseImages, totalTime: Int?, url: String, uri: String?, shareAs: String?, yield: Double?, ingredients: [ResonseIngredient]) {
        self.label = label
        self.images = images
        self.totalTime = totalTime
        self.url = url
        self.uri = uri
        self.shareAs = shareAs
        self.yield = yield
        self.ingredients = ingredients
    }
    
    var label: String // recipe name
    var images: ResponseImages
    var totalTime: Int?
    var uri: String? // Original recipe URL with id
    var url: String? // Original recipe URL
    var shareAs: String? // API recipe URL
    var yield: Double? // Number of servings 
    var ingredients: [ResonseIngredient]
}
