//
//  ListRecipe.swift
//  reciplease
//
//  Created by Gilles David on 27/01/2022.
//

import UIKit


class ListRecipeViewController: UIViewController {
    
    
    var listArgumentsFetch: [String] = []
    var listRecipesToShow:[RecipeToShow] = []
    let listRecipeModel = ListRecipeModel.shared
    var positionInListToDownload = 0
    
    var recipeToShow: RecipeToShow!
    var rowSelected: Int = 0
    
    @IBOutlet weak var tableViewRecipe: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listRecipeModel.searchRecipes(tblStringRequest: listArgumentsFetch) {
            
            result in
            switch result {
            case .Success(response: let resp):
                print(resp.count)
                self.listRecipesToShow = resp
                self.positionInListToDownload = 0
                self.updateImgs()
            case .Zero:
                print("Return zero")
            case .Failure(let error):
                print("Return Failure with error :", error)
            }
            
        }
    }
    

    
    private func updateImgs() {
        print("-----updateImgs & pos :", positionInListToDownload)
        if positionInListToDownload < listRecipesToShow.count {
            let urlImgToDowloadNow = listRecipesToShow[positionInListToDownload].images
            if urlImgToDowloadNow.count > 0 {
                listRecipeModel.searchOneImage(url: urlImgToDowloadNow[0]) {
                    [self] result in
                    switch result {
                    case .Success(let img):
                        listRecipesToShow[positionInListToDownload].img = img
                    case .Failure(failure: let error):
                        print("******> error", error.localizedDescription)
                    }
                    positionInListToDownload += 1
                    self.tableViewRecipe.reloadData()
                    updateImgs()
                }
            }else {
                positionInListToDownload += 1
            }
        } else {
            positionInListToDownload = 0
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableViewRecipe.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "segueToDetails" {
                let detailVC = segue.destination as! DetailViewController
                detailVC.recipeToShow = listRecipesToShow[rowSelected]
            }
        }
}
//MARK: - TableViewDataSource
extension ListRecipeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listRecipesToShow.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(recipe: listRecipesToShow[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        rowSelected = indexPath[1]
        performSegue(withIdentifier: "segueToDetails", sender: self)
    }
}
