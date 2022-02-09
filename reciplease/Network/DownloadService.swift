//
//  Download.swift
//  reciplease
//
//  Created by Gilles David on 28/01/2022.
//

import UIKit
import Alamofire

enum Result<T: Codable>{
    case Success(response: T)
    case Failure(failure: RequestError)
}
enum ResultImage{
    case Success(response: UIImage)
    case Failure(failure: RequestError)
}
enum RequestError: Error {
    case returnNil
    case statusCodeWrong
    case decodeError
}

class DownloadService {
    
    public static let shared = DownloadService()
    //private var task: URLSessionDataTask?
    private init(){ }
    
    public func downloadRecipes(url: String, completionHandler: @escaping (Result<ResponseRequest>) -> Void) {
        AF.request(url, method: .get)
            .response(){ (response) in
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
                    completionHandler(.Failure(failure: RequestError.decodeError))
                    return
                }
                completionHandler(.Success(response: responseJSON))
            }
//            .responseDecodable(of: ResponseRequest.self) { (response) in } 
    }


    public func downloadImage(url: String, completionHandler: @escaping (ResultImage) -> Void) {
        AF.request(url, method: .get)
            .response(){ (response) in
                guard let _ = response.data, response.error == nil else {
                    completionHandler(.Failure(failure: RequestError.returnNil))
                    return
                }
                guard let _ = response.response, response.response!.statusCode == 200 else {
                    completionHandler(.Failure(failure: RequestError.statusCodeWrong))
                    return
                }
                guard let rec = response.value else { 
                    completionHandler(.Failure(failure: RequestError.decodeError))
                    return}
                
                guard let responseImage = UIImage(data: rec!) else {
                    completionHandler(.Failure(failure: RequestError.decodeError))
                    return
                }
                completionHandler(.Success(response: responseImage))
            }
    }
}


