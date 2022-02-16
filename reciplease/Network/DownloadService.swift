//
//  Download.swift
//  reciplease
//
//  Created by Gilles David on 28/01/2022.
//

import Foundation
import Alamofire

enum Result<T: Codable>{
    case Success(response: T)
    case Failure(failure: RequestError)
}
enum ResultImage{
    case Success(response: Data)
    case Failure(failure: RequestError)
}
enum RequestError: Error {
    case returnZero
    case returnNil
    case statusCodeWrong
    case decodeError
}

class DownloadService {
    
    static let shared = DownloadService()
    init(){ }
    
    internal func downloadRecipes(url: String, completionHandler: @escaping (Result<ResponseRequest>) -> Void) {
        
        AF.request(url, method: .get)
            .response(){ response in
                guard let _ = response.data, response.error == nil else {
                    completionHandler(Result.Failure(failure: RequestError.returnNil))
                    return
                }
                guard let _ = response.response, response.response!.statusCode == 200 else {
                    completionHandler(.Failure(failure: RequestError.statusCodeWrong))
                    return
                }
                guard let rec = response.value else { 
                    completionHandler(.Failure(failure: RequestError.decodeError))
                    return }
                guard let responseJSON = try? JSONDecoder().decode(ResponseRequest.self, from: rec!) else {
                    print(url.description ,rec!)
                    completionHandler(.Failure(failure: RequestError.decodeError))
                    return
                }
                completionHandler(.Success(response: responseJSON))
            }
    }


    internal func downloadImage(url: String, completionHandler: @escaping (ResultImage) -> Void) {
        AF.request(url, method: .get)
            .response(){ response in
                guard let _ = response.data, response.error == nil else {
                    completionHandler(.Failure(failure: RequestError.returnNil))
                    return
                }
                guard let _ = response.response, response.response!.statusCode == 200 else {
                    completionHandler(.Failure(failure: RequestError.statusCodeWrong))
                    return
                }
                guard let responseDataImg = response.value else { 
                    completionHandler(.Failure(failure: RequestError.decodeError))
                    return}
                
                completionHandler(.Success(response: responseDataImg!))
            }
    }


    
}


