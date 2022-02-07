//
//  Constants.swift
//  reciplease
//
//  Created by Gilles David on 30/01/2022.
//

import Foundation

enum Constants {
    
    // URL Edamam
    static let urlApiEdamam = "https://api.edamam.com/api/recipes/v2?type=public&q={textQueryPattern}&app_id=\(ApiKey.apiAppl)&app_key=\(ApiKey.apiEdamam)"

    static let textQueryPattern = "{textQueryPattern}"
    
    // Img recipe by default
    static let nameImageByDefault = "cooking.png"
    
}

/* Thumbnail : 100×100, Small : 200×200, Regular : 300×300, Large : 600×600 */
// In the desired/required order
enum SizeImgRecipe: String, CaseIterable{
    case regular    // urlWebSiteEdamam/img/id.jpg
    case small      // urlWebSiteEdamam/img/id-m.jpg
    case thumbnail  // urlWebSiteEdamam/img/id-s.jpg
    case large      // urlWebSiteEdamam/img/id-l.jpg
}
