//
//  ResponseRequest.swift
//  reciplease
//
//  Created by Gilles David on 25/01/2022.
//

import Foundation

class ResponseRequest: Codable {
    
    init(from: Int, to: Int, count: Int, hits: [ResponseHit]) {
        self.from = from
        self.to = to
        self.count = count
        self.hits = hits
    }
    
    var from: Int
    var to: Int
    var count: Int
    var hits: [ResponseHit]
    
}
