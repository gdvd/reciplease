//
//  ViewController.swift
//  reciplease
//
//  Created by Gilles David on 19/01/2022.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let recipe = Recipe(context: AppDelegate.viewContext)
        //recipe.label = "azerty"
    }


}

