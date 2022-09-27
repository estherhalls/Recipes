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
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    @IBAction func isFavButtonTapped(_ sender: Any) {
    }
    
}
