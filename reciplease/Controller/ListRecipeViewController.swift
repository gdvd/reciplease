//
//  ListRecipe.swift
//  reciplease
//
//  Created by Gilles David on 27/01/2022.
//

import UIKit


class ListRecipeViewController: UIViewController {
    
    var listArguments: [String] = []
    var resultRequest: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(listArguments.count.description)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
}
extension ListRecipeViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultRequest.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
        //let recipe = resultRequest[indexPath]
        //cell.textLabel?.text = recipe.name
        return cell
    }
    
}
