//
//  DetailFavoriteViewController.swift
//  reciplease
//
//  Created by Gilles David on 09/02/2022.
//

import UIKit

class DetailFavoriteViewController: UIViewController {
    
    
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var labelRecipe: UILabel!
    
    @IBOutlet weak var labelIngredient: UILabel!
    @IBOutlet weak var listIngredients: UITextView!
    
    @IBOutlet weak var yieldLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var imageStar: UIButton!
    @IBOutlet weak var squareInfo: UIView!
    
    var recipeToShow: RecipeToShow!
    
    var prevDelegate: FavoriteViewController!
    let detailModel = DetailModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customSquareInfo()
        showInfoRecipe()
    }
    
    private func toggleFavorite() {
        let pushedToDb = detailModel.setValueForFavoriteInDb(idRecipe: recipeToShow.idRecipe, favorite: !recipeToShow.favorite)
        if let prevDelegate = self.prevDelegate, pushedToDb {
            recipeToShow.favorite = !recipeToShow.favorite
            setColorIconFavorite()
            prevDelegate.updateFavoriteFromDetailVC(idRecipe: recipeToShow.idRecipe, favorite: recipeToShow.favorite)
        }
    }
    
    func customSquareInfo(){
        squareInfo.layer.cornerRadius = 7
        squareInfo.layer.borderColor = UIColor.systemGray3.cgColor;
        squareInfo.layer.borderWidth = 2;
    }

    private func showInfoRecipe() {
        
        if let dataImg = recipeToShow.dataImg {
            recipeImg.image = UIImage(data: dataImg)
        } else {
            recipeImg.image = UIImage(named: Constants.nameImageByDefault)
        }
        
        labelRecipe.text = recipeToShow.label
        let listdetailIngr = "\n- " + recipeToShow.ingredientWithDetails.joined(separator: "\n- ")
        listIngredients.text = listdetailIngr
        yieldLabel.text = recipeToShow.yield
        durationLabel.text = recipeToShow.duration
        addShadowInView(radius: 80)
        setColorIconFavorite()
    }
    
    private func setColorIconFavorite(){
        if recipeToShow.favorite{
            imageStar.tintColor = UIColor(displayP3Red: 59/255, green: 130/255, blue: 84/255, alpha: 1)
        } else {
            imageStar.tintColor = .white
        }
    }
    
    func addShadowInView(radius: CGFloat){
        let topColor: UIColor = UIColor(red: 57/255, green: 54/255, blue: 52/255, alpha: 1)
        let shadowLayer = CAGradientLayer()
        shadowLayer.cornerRadius = recipeImg.layer.cornerRadius
        shadowLayer.frame = CGRect(x: 0.0, y: recipeImg.layer.bounds.height - radius - 13, width: recipeImg.layer.bounds.width, height: radius)
        shadowLayer.colors = [ UIColor.clear.cgColor, topColor.cgColor ]
        recipeImg.layer.addSublayer(shadowLayer)
    }
    
    
    @IBAction func getDirectionButton(_ sender: Any) {
        // GoTo recipeToShow.urlSrc
        if let urlToGo = recipeToShow.urlSrc {
            let url = URL(string: urlToGo)!
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func imageStarAction(_ sender: Any) {
        toggleFavorite()
    }
    
    
}
