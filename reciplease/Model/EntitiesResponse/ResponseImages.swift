//
//  ResponseImages.swift
//  reciplease
//
//  Created by Gilles David on 25/01/2022.
//

import Foundation

class ResponseImages: Codable {
    
    init(THUMBNAIL: ResponseImage, SMALL: ResponseImage, REGULAR: ResponseImage, LARGE: ResponseImage) {
        self.THUMBNAIL = THUMBNAIL
        self.SMALL = SMALL
        self.REGULAR = REGULAR
        self.LARGE = LARGE
    }
    
    var THUMBNAIL: ResponseImage
    var SMALL: ResponseImage
    var REGULAR: ResponseImage
    var LARGE: ResponseImage
    
    
}

class ResponseImage: Codable {
    
    init(url: [String], width: Int, height: Int) {
        self.url = url // Recipe image URL
        self.width = width
        self.height = height
    }
    
    var url: [String]
    var width: Int
    var height: Int
}
