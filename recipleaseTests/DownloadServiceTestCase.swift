//
//  DownloadServiceTestCase.swift
//  recipleaseTests
//
//  Created by Gilles David on 11/02/2022.
//

import XCTest
@testable import reciplease

class DownloadServiceTestCase: XCTestCase {

    /*func testUserFetching() {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
        let sessionManager = Session(configuration: configuration)

        let apiEndpoint = URL(string: "https://api.example.com/user")!
        let expectedUser = User(name: "Antoine van der Lee")
        let requestExpectation = expectation(description: "Request should finish")

        let mockedData = try! JSONEncoder().encode(expectedUser)
        let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [.get: mockedData])
        mock.register()

        sessionManager
            .request(apiEndpoint)
            .responseDecodable(of: User.self) { (response) in
                XCTAssertNil(response.error)
                XCTAssertEqual(response.value, expectedUser)
                requestExpectation.fulfill()
            }.resume()

        wait(for: [requestExpectation], timeout: 10.0)
    }*/

}
