//
//  ResponseRequest.swift
//  reciplease
//
//  Created by Gilles David on 25/01/2022.
//

import Foundation

struct ResponseRequest: Codable {
    init(from: Int, to: Int, count: Int, hits: [ResponseHit]
         , links: ResponseLinks?
    ) {
        self.from = from
        self.to = to
        self.count = count
        self.hits = hits
        self.links = links
    }
    var from: Int
    var to: Int
    var count: Int
    var hits: [ResponseHit]
    var links: ResponseLinks?
    
    private enum CodingKeys: String, CodingKey {
        case from
        case to
        case count
        case hits
        case links = "_links"
    }
}
struct ResponseLinks: Codable {
    init(next: ResponseNext?){
        self.next = next
    }
    var next: ResponseNext?
}
struct ResponseNext: Codable {
    init(href: String?, title: String?){
        self.href = href
        self.title = title
    }
    var href: String?
    var title: String?
}
