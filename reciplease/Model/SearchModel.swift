//
//  SearchModel.swift
//  reciplease
//
//  Created by Gilles David on 27/01/2022.
//

import Foundation

class SearchModel {
    
    public var listArguments: [String] = []
    
    public static let shared = SearchModel()
    private init() {}
    
    public func description() -> String {
        if listArguments.count > 1 {
            return "- " + listArguments.joined(separator: "\n- ")
        } else {
            return "- " + listArguments[0]
        }
    }
    
    public func addOneArg(_ arg: String) {
        listArguments.append(arg)
    }
    
    public func clearListArg() {
        listArguments = []
    }
    
}
