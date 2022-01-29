//
//  ResponseRecipe.swift
//  reciplease
//
//  Created by Gilles David on 25/01/2022.
//

import Foundation


class ResponseRecipe: Codable {
    
    init(label: String, images: ResponseImage, totalTime: Int, url: [String], shareAs: [String], yield: Int, ingredients: [ResonseIngredient]) {
        self.label = label
        self.images = images
        self.totalTime = totalTime
        self.url = url
        self.shareAs = shareAs
        self.yield = yield
        self.ingredients = ingredients
    }
    
    var label: String
    var images: ResponseImage
    var totalTime: Int
    var url: [String] // Original recipe URL
    var shareAs: [String] // API recipe URL
    var yield: Int // Number of servings 
    var ingredients: [ResonseIngredient]
}
