//
//  RecipeCategoryController.swift
//  Recipes
//
//  Created by Esther on 9/27/22.
//

import Foundation

class RecipeCategoryController {
    
    // MARK: - Singleton - initialized so we don't have to unwrap it everywhere we use it
    // used so that the source of truth array is only initialized once and not every time it is run
    static let sharedInstance = RecipeCategoryController()
    
    // MARK: - SOT (allows us to access properties of functions outside of their function)
    // = [] is giving the array a default value of initialized
    var categories: [RecipeCategory] = []
    
    // MARK: - CRUD
    // Create Category
    func create(title: String) {
        let category = RecipeCategory(title: title)
        categories.append(category)
        save()
     
    }
    // Update Category
    func update(category: RecipeCategory, newTitle: String) {
        category.title = newTitle
        save()
        
    }

    // Delete Category
    func delete(category: RecipeCategory) {
        //where is it? firstIndex can be used because we made equatable protocol
        guard let index = categories.firstIndex(of: category) else {return}
        categories.remove(at: index)
        save()
        
    }
    
    // MARK: - Persistance
        func save() {
            // 1. Get the address to save the file to
            guard let url = fileURL else { return }
            do {
                // 2. Convert the swift struct or class into raw data
                let data = try JSONEncoder().encode(categories)
                // 3. Save the data to the address from step 1
                try data.write(to: url)
            } catch let error {
                print(error)
            }
        }
        
        func load() {
            // 1. Get the address your data is saved at
            guard let url = fileURL else { return }
            do {
                // 2. Load the data from the address - initializing data type Data from contentsOf:
                let data = try Data(contentsOf: url)
                // 3. Decode that data into our Swift model object
                let categories = try JSONDecoder().decode([RecipeCategory].self, from: data)
                // Set the SOT
                self.categories = categories
            } catch let error {
                print(error)
            }
        }
        
        private var fileURL: URL? {
            guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
            let url = documentsDirectory.appendingPathComponent("recipeCategories.json")
            return url
        }
    
} // End of Class
