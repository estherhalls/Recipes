//
//  RecipeListTableViewController.swift
//  Recipes
//
//  Created by Esther on 9/27/22.
//

import UIKit

class RecipeListTableViewController: UITableViewController {
    // MARK: - Outlets
    @IBOutlet weak var categoryNameTextField: UITextField!
    
    // Receiver:
    var category: RecipeCategory?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let category = category
        let title = categoryNameTextField.text else {return}
        RecipeCategoryController.sharedInstance.update(category: category, newTitle: title)
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // you can unwrap optional count with nil coalessing
        return category?.recipes.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as? RecipeTableViewCell, let category = category else {return UITableViewCell()}
        // this category is coming from our reciever and is unwrapped in the body of above guard let
        let recipe = category.recipes[indexPath.row]
        cell.configure(with: recipe)


        return cell
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            guard let category = category else { return }
            let recipe = category.recipes[indexPath.row]
            
            RecipeController.delete(deleteRecipe: recipe, from: category)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }

    // MARK: - Actions
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let category = category else {return}
        RecipeController.create(in: category)
        tableView.reloadData()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toDetailVC",
            let index = tableView.indexPathForSelectedRow,
            let destination = segue.destination as? RecipeDetailViewController,
            let category = category else {return}
        let recipe = category.recipes[index.row]
        destination.recipe = recipe
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    

}
