//
//  ResponseImages.swift
//  reciplease
//
//  Created by Gilles David on 25/01/2022.
//

import Foundation

struct ResponseImages: Codable {
    
    init(thumbnail: ResponseImage?, small: ResponseImage?, regular: ResponseImage?, large: ResponseImage?) {
        self.thumbnail = thumbnail
        self.small = small
        self.regular = regular
        self.large = large
    }
    
    var thumbnail: ResponseImage?
    var small: ResponseImage?
    var regular: ResponseImage?
    var large: ResponseImage?
    
    private enum CodingKeys: String, CodingKey {
        case thumbnail = "THUMBNAIL"
        case small = "SMALL"
        case regular = "REGULAR"
        case large = "LARGE"
    }
}

struct ResponseImage: Codable {
    
    init(url: String, width: Int, height: Int) {
        self.url = url // Recipe image URL
        self.width = width
        self.height = height
    }
    
    var url: String
    var width: Int
    var height: Int
}
