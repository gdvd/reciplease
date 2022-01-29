//
//  SearchModelTestCase.swift
//  recipleaseTests
//
//  Created by Gilles David on 28/01/2022.
//

import XCTest
@testable import reciplease

class SearchModelTestCase: XCTestCase {
    
    let searchModel = SearchModel.shared
    
    override func setUp() {
        searchModel.listArguments = []
    }
    
    func testAddOneArgGivenArgThenListCountOne(){
        searchModel.addOneArg("ABC")
        XCTAssertEqual(searchModel.listArguments, ["ABC"])
    }
    
    func testAddOneMoreArgGivenArgThenListCountTwo(){
        searchModel.listArguments = ["ABC"]
        searchModel.addOneArg("DEF")
        XCTAssertEqual(searchModel.listArguments, ["ABC", "DEF"])
    }
    
    func testClearListArgGivenArgAndClearListThenListCountZero(){
        searchModel.listArguments = ["ABC"]
        searchModel.clearListArg()
        XCTAssertEqual(searchModel.listArguments, [])
    }
    
    func testDescriptionGivenOneArgThenHaveToOneString(){
        searchModel.listArguments = ["ABC"]
        XCTAssertEqual(searchModel.description(), "- ABC")
    }
    
    func testDescriptionGivenTwoArgThenHaveToOneString(){
        searchModel.listArguments = ["ABC", "DEF"]
        XCTAssertEqual(searchModel.description(), "- ABC\n- DEF")
    }

}
