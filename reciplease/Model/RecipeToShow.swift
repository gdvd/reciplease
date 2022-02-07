//
//  RecipeToShow.swift
//  reciplease
//
//  Created by Gilles David on 05/02/2022.
//

import UIKit
import Foundation

struct RecipeToShow {
    
    init(idRecipe: String, label: String, yield: String, duration: String, ingredients: [String], ingredientWithDetails: [String]) {
        self.idRecipe = idRecipe
        self.label = label
        self.yield = yield
        self.duration = duration
        self.ingredients = ingredients
        self.ingredientWithDetails = ingredientWithDetails
    }
    
    let idRecipe: String!
    let label: String!
    let yield: String!
    let duration: String!
    let ingredients: [String]!
    let ingredientWithDetails: [String]!
    
    var img: UIImage! = UIImage(named: Constants.nameImageByDefault)
    var images: [String] = []
    var favorite: Bool = false
    
    
}
