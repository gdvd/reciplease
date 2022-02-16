//
//  FavoriteModelTestCase.swift
//  recipleaseTests
//
//  Created by Gilles David on 11/02/2022.
//

import XCTest
@testable import reciplease

class FavoriteModelTestCase: XCTestCase {

    
    func testSearchOneImageWhenDataExistGivenSuccessWithImage() {
        
        let downloadService = FakeDownloadService(isCase: .success)
        let favoriteModel = FavoriteModel(downloadService: downloadService)
        
        favoriteModel.searchOneImage(url: "") {
            result in 
            switch result {
            case .Success(response: let dataImg):
                let imgRef = UIImage(named: "cooking.png")
                let img = UIImage(data: dataImg)
                XCTAssertEqual(imgRef?.size, img?.size)
            case .Failure(failure: _):
                XCTAssert(false)
            }
        }
    }
    
    func testSearchOneImageWhenDataDoesntExistGivenFailure() {
        
        let downloadService = FakeDownloadService(isCase: .failure)
        let favoriteModel = FavoriteModel(downloadService: downloadService)
        
        favoriteModel.searchOneImage(url: "") {
            result in 
            switch result {
            case .Success(response: _):
                XCTAssert(false)
            case .Failure(failure: _):
                XCTAssert(true)
            }
        }
    }

}
