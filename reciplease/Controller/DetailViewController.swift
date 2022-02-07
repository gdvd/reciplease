//
//  DetailViewController.swift
//  reciplease
//
//  Created by Gilles David on 06/02/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var recipeToShow: RecipeToShow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad", recipeToShow.label!)
        // Do any additional setup after loading the view.
    }
    
    
}
