//
//  RecipeTableViewCell.swift
//  Recipes
//
//  Created by Esther on 9/27/22.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var recipeSubtitleLabel: UILabel!
    
    // Helper Functions
    func configure(with recipe: Recipe) {
        recipeTitleLabel.text = recipe.title
        recipeSubtitleLabel.text = "\(recipe.calories ?? 0)"
        //calories was optional, so we nil coalesced within the string interpolation
        
        let imageName = recipe.isFavorite ? "star.fill" : "star"
        let favoriteImage = UIImage(systemName: imageName)
        favoriteButton.setImage(favoriteImage, for: .normal)
        
        // Alternative, but not as good for favorite button:
//        if recipe.isFavorite == true {
//            favoriteButton.imageView?image = UIImage(systemName: "star.fill")
//        }else{
//            favoriteButton.imageView?.image = UIImage(systemName: "star")
//        }
    }

    
    // MARK: - Actions
    @IBAction func isFavButtonTapped(_ sender: Any) {
    }
    

} // End of Class
