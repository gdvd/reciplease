//
//  ResponseRecipe.swift
//  reciplease
//
//  Created by Gilles David on 25/01/2022.
//

import Foundation


class ResponseRecipe {
    
    init(label: String, totalTime: Int, url: [String], shareAs: [String], yield: Int) {
        self.label = label
        self.totalTime = totalTime
        self.url = url
        self.shareAs = shareAs
        self.yield = yield
    }
    
    var label: String
    var totalTime: Int
    var url: [String] // URL original recipe
    var shareAs: [String] // URL API recipe
    var yield: Int
}
