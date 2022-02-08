//
//  FavoriteModel.swift
//  reciplease
//
//  Created by Gilles David on 08/02/2022.
//

import Foundation

class FavoriteModel {
    
    private var manageCoreData = ManageCoreData.shared
    private var downloadService = DownloadService.shared
    
    public static let shared = FavoriteModel()
    private init() {}
    
    public func getAllRecipeToShowWhenFavoriteIsTrue() -> [RecipeToShow]{
        return manageCoreData.getAllRecipeToShowWhenFavoriteIsTrue()
    }
    public func searchOneImage(url: String, completionHandler: @escaping (ResultImage) -> Void) {
        downloadService.downloadImage(url: url) { resultImage in
            switch resultImage {
            case .Success(response: let img):
                completionHandler(.Success(response: img))
            case .Failure(failure: let error):
                completionHandler(ResultImage.Failure(failure: error))
            }
        }
    }
}
