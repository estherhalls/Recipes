//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by Esther on 9/27/22.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var caloriesTextField: UITextField!
    @IBOutlet weak var caloriesTextLabel: UILabel!
    @IBOutlet weak var cookTimeTextField: UITextField!
    @IBOutlet weak var cookTimeTextLabel: UILabel!
    @IBOutlet weak var instructionsTextView: UITextView!
    @IBOutlet weak var recipeTitleTextField: UITextField!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    // Receiver - needs colon, not assignment operator
    var recipe: Recipe?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        updateViews()
    }
    func updateViews() {
        guard let recipe = recipe else {return}
        recipeTitleTextField.text = recipe.title
        instructionsTextView.text = recipe.instructions
        caloriesTextField.text = "\(recipe.calories ?? 0)"
        cookTimeTextField.text = "\(recipe.cookTime)"
        updateButton()
    }
    func updateButton() {
        guard let recipe = recipe else {return}
        let favoriteImageName = recipe.isFavorite ? "star.fill" : "star"
        let favoriteImage = UIImage(systemName: favoriteImageName)
        favoriteButton.setImage(favoriteImage, for: .normal)
    }

    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let recipe = recipe,
              let title = recipeTitleTextField.text,
              let instructions = instructionsTextView.text,
              let calories = Int(caloriesTextField.text ?? ""),
              let cookTime = Int(cookTimeTextField.text ?? "")
        else {return}
        
        RecipeController.update(updateRecipe: recipe, newTitle: title, newInstructions: instructions, newCals: calories, newCookTime: cookTime)
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func isFavButtonTapped(_ sender: Any) {
        guard let recipe = recipe else {return}
        RecipeController.toggleFavorite(for: recipe)
        updateButton()
    }
    
}
