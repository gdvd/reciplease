//
//  ResonseIngredient.swift
//  reciplease
//
//  Created by Gilles David on 25/01/2022.
//

import Foundation

struct ResonseIngredient: Codable {
    
    init(text: String, quantity:Double, measure: String?, food: String, foodId: String, weight: Double?) {
        self.text = text
        self.quantity = quantity
        self.measure = measure
        self.food = food
        self.foodId = foodId
        self.weight = weight
    }
    
    var text: String
    var quantity:Double
    var measure: String?
    var food: String
    var foodId: String
    var weight: Double?
    
}
