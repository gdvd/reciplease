//
//  Download.swift
//  reciplease
//
//  Created by Gilles David on 28/01/2022.
//

import Foundation

enum Result<Success, Failure> where Failure : Error {
    case success(Success)
    case failure(Failure)
}

class DownloadService {
    
    
}
