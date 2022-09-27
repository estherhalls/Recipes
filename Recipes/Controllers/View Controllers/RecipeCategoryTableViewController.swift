//
//  RecipeCategoryTableViewController.swift
//  Recipes
//
//  Created by Esther on 9/27/22.
//

import UIKit

class RecipeCategoryTableViewController: UITableViewController {
    // MARK: - Outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return RecipeCategoryController.sharedInstance.categories.count
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        let category = RecipeCategoryController.sharedInstance.categories[indexPath.row]
        cell.textLabel?.text = category.title
        cell.detailTextLabel?.text = "\(category.recipes.count) Recipes"


        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let category = RecipeCategoryController.sharedInstance.categories[indexPath.row]
            RecipeCategoryController.sharedInstance.delete(category: category)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRecipeTBVC" {
            if let index = tableView.indexPathForSelectedRow {
                if let destination = segue.destination as? RecipeListTableViewController {
                    let category = RecipeCategoryController.sharedInstance.categories[index.row]
                    destination.category = category
                }
            }
        }
    }
    // MARK: - Actions
    @IBAction func addButtonTapped(_ sender: Any) {
        RecipeCategoryController.sharedInstance.create(title: "Untitled Category")
        tableView.reloadData()
    }
    

} // End of Class
