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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // MARK: - Actions
    @IBAction func isFavButtonTapped(_ sender: Any) {
    }
    

}
