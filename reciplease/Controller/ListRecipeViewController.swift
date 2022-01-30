//
//  ListRecipe.swift
//  reciplease
//
//  Created by Gilles David on 27/01/2022.
//

import UIKit


class ListRecipeViewController: UIViewController, UITableViewDataSource {
    
    var listArguments: [String] = []
    
    @IBOutlet weak var tableViewRecipe: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableViewRecipe.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArguments.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(ingredients: listArguments[indexPath.row])
        return cell
    }
    
}
