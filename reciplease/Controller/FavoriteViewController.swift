//
//  FavoriteViewController.swift
//  reciplease
//
//  Created by Gilles David on 25/01/2022.
//

import UIKit

class FavoriteViewController: UIViewController {
        
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    
    @IBOutlet weak var favoriteTableView: UITableView!
    
    var listArgumentsFetch: [String] = []
    var listRecipesToShow:[RecipeToShow] = []
    let favoriteModel = FavoriteModel.shared
    var rowSelected: Int = 0
    
    var recipeToShow: RecipeToShow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func initData() {
        listRecipesToShow = favoriteModel.getAllRecipeToShowWhenFavoriteIsTrue()
        updateImgs(findNb: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initData()
        
        if listRecipesToShow.count > 0 {
            explanationLabel.isHidden = true
        } else {
            explanationLabel.isHidden = false
        }
        favoriteTableView.reloadData()
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
                favoriteModel.searchOneImage(url: urlImgToDowloadNow[0]) {
                    [self] result in
                    switch result {
                    case .Success(let img):
                        listRecipesToShow[findNb].img = img
                    case .Failure(failure: let error):
                        print("******> error", error.localizedDescription)
                    }
                    updateImgs(findNb: findNb + 1)
                    self.favoriteTableView.reloadData()
                }
            }else {
                updateImgs(findNb: findNb + 1)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToFavoriteDetails" {
            let detailVC = segue.destination as! DetailFavoriteViewController
            detailVC.recipeToShow = listRecipesToShow[rowSelected]
            detailVC.prevDelegate = self
        }
    }
}
//MARK: - TableViewDataSource
extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listRecipesToShow.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeFavoriteCell", for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(recipe: listRecipesToShow[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        rowSelected = indexPath[1]
        performSegue(withIdentifier: "segueToFavoriteDetails", sender: self)
    }
    
}
