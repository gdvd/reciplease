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
    
    var recipeToShow: RecipeToShow!
    var rowSelected: Int = 0
    
    @IBOutlet weak var tableViewRecipe: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
    }
    
    private func initData() {
        listRecipeModel.searchRecipes(tblStringRequest: listArgumentsFetch) {
            
            result in
            switch result {
            case .Success(response: let resp):
                print(resp.count)
                self.listRecipesToShow = resp
                self.updateImgs(findNb: 0)
            case .Zero:
                print("Return zero")
            case .Failure(let error):
                print("Return Failure with error :", error)
            }
            
        }
    }
    
    public func updateFavoriteFromDetailVC(idRecipe: String, favorite: Bool){
        for (index, _) in listRecipesToShow.enumerated() {
            if listRecipesToShow[index].idRecipe == idRecipe {
                listRecipesToShow[index].favorite = favorite
            }
        }
    }
    
    private func updateImgs(findNb: Int) {
        if findNb < listRecipesToShow.count {
            let urlImgToDowloadNow = listRecipesToShow[findNb].images
            if urlImgToDowloadNow.count > 0 {
                listRecipeModel.searchOneImage(url: urlImgToDowloadNow[0]) {
                    [self] result in
                    switch result {
                    case .Success(let img):
                        listRecipesToShow[findNb].img = img
                    case .Failure(failure: let error):
                        print("******> error", error.localizedDescription)
                    }
                    updateImgs(findNb: findNb + 1)
                    self.tableViewRecipe.reloadData()
                }
            }else {
                updateImgs(findNb: findNb + 1)
            }
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
                detailVC.prevDelegate = self
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
