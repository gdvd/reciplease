//
//  ResonseIngredient.swift
//  reciplease
//
//  Created by Gilles David on 25/01/2022.
//

import Foundation

class ResonseIngredient: Codable {
    
    init(text: String, quantity:Double, measure: String, food: String) {
        self.text = text
        self.quantity = quantity
        self.measure = measure
        self.food = food
    }
    
    var text: String
    var quantity:Double
    var measure: String
    var food: String
    
    
}
