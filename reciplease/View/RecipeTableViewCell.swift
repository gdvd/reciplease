//
//  RecipeTableViewCell.swift
//  reciplease
//
//  Created by Gilles David on 29/01/2022.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    //Cell
    @IBOutlet weak var customCell: UIView!
    @IBOutlet weak var imageRecipe: UIImageView!
    
    // Elements Cell
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var labelRecipe: UILabel!
    
    // Elements Cell -> Square info recipe
    @IBOutlet weak var squareInfo: UIView! 
    @IBOutlet weak var viewSquareInfo: UIView!
    @IBOutlet weak var nbYield: UILabel!
    @IBOutlet weak var iconYield: UIImageView!
    @IBOutlet weak var durationRecipe: UILabel!
    @IBOutlet weak var iconDurationRecipe: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addShadowInView(radius: 55)
        customSquareInfo()
    }
    
    func customSquareInfo(){
        squareInfo.layer.cornerRadius = 7
        squareInfo.layer.borderColor = UIColor.systemGray3.cgColor;
        squareInfo.layer.borderWidth = 2;
    }
    
    func configure(recipe: RecipeToShow){
        
        ingredientsLabel.text = recipe.ingredientWithDetails.joined(separator: ", ")
        labelRecipe.text = recipe.label
        imageRecipe.image = recipe.img
        nbYield.text = recipe.yield
        durationRecipe.text = recipe.duration
    }
    
    func addShadowInView(radius: CGFloat){
        let topColor: UIColor = UIColor.black.withAlphaComponent(0.9)
        let shadowLayer = CAGradientLayer()
        shadowLayer.cornerRadius = layer.cornerRadius
        shadowLayer.frame = CGRect(x: 0.0, y: imageRecipe.layer.bounds.height - radius, width: imageRecipe.layer.bounds.width + 15, height: radius)
        shadowLayer.colors = [
            UIColor.clear.cgColor
            ,topColor.cgColor
        ]
        imageRecipe.layer.addSublayer(shadowLayer)
    }

}
