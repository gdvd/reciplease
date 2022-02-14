//
//  DownloadServiceFake.swift
//  recipleaseTests
//
//  Created by Gilles David on 13/02/2022.
//

import UIKit
@testable import reciplease

class FakeDownloadService: DownloadService {
    
    enum WitchCase {
        case success
        case resultZeroRecipe
        case failure
    }
    var isCase: WitchCase!
    
    init(isCase: WitchCase) { 
        super.init() 
        self.isCase = isCase
    }
    
    override func downloadImage(url: String, completionHandler: @escaping (ResultImage) -> Void) {
        switch isCase {
        case .success:
            let img = UIImage(named: "cooking.png")
            completionHandler(.Success(response: img!))
        case .resultZeroRecipe:
            completionHandler(.Failure(failure: .returnNil))
        case .failure:
            completionHandler(.Failure(failure: .returnNil))
        case .none:
            fatalError()
        }
    }
    
    override func downloadRecipes(url: String, completionHandler: @escaping (Result<ResponseRequest>) -> Void) {
        switch isCase {
        case .success:
            let bundle = Bundle(for: FakeDownloadService.self)
            let url = bundle.url(forResource: "requestBeefTwoResponseLight", withExtension: "json")
            
            if let data = try? Data(contentsOf: url!) {
                guard let responseJSON = try? JSONDecoder().decode(ResponseRequest.self, from: data) else{
                    return
                }
                completionHandler(.Success(response: responseJSON))
            }
        case .resultZeroRecipe:
            let bundle = Bundle(for: FakeDownloadService.self)
            let url = bundle.url(forResource: "zeroRecipe", withExtension: "json")
            
            if let data = try? Data(contentsOf: url!) {
                guard let responseJSON = try? JSONDecoder().decode(ResponseRequest.self, from: data) else{
                    return
                }
                completionHandler(.Success(response: responseJSON))
            }
        case .failure:
            completionHandler(.Failure(failure: .returnNil))
        case .none:
            fatalError()
        }
    }
    
}
