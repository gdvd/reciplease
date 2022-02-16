//
//  RecipeToShow.swift
//  reciplease
//
//  Created by Gilles David on 05/02/2022.
//

import Foundation

struct RecipeToShow {
    
    init(idRecipe: String, label: String, yield: String, duration: String, ingredients: [String], ingredientWithDetails: [String], urlApi: String, urlSrc: String, favorite: Bool) {
        self.idRecipe = idRecipe
        self.label = label
        self.yield = yield
        self.duration = duration
        self.ingredients = ingredients
        self.ingredientWithDetails = ingredientWithDetails
        self.urlApi = urlApi
        self.urlSrc = urlSrc
        self.favorite = favorite
    }
    
    var idRecipe: String!
    let label: String!
    let yield: String!
    let duration: String!
    let ingredients: [String]!
    let ingredientWithDetails: [String]!
    let urlApi: String!
    let urlSrc: String!
    
    var dataImg: Data?
    var images: [String] = []
    var favorite: Bool
    
}
