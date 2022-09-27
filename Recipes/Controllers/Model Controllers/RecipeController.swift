//
//  RecipeController.swift
//  Recipes
//
//  Created by Esther on 9/27/22.
//

import Foundation

class RecipeController {
    // MARK: - CRUD
    // Create Recipe
    func create(title: String = "Untitled Recipe", cookTime: Int = 0, calories: Int? = 0, instructions: String = " Enter Recipe Description", in category: RecipeCategory) {
        let recipe = Recipe(title: title, cookTime: cookTime, calories: calories, instructions: instructions)
        // Recipe is added to end of recipes array that is within the category parent that we called as a property in this function
        category.recipes.append(recipe)
        RecipeCategoryController.sharedInstance.save()
        
    }
    // Update Recipe
    func update(updateRecipe: Recipe, newTitle: String, newInstructions: String, newCals: Int, newCookTime: Int) {
        updateRecipe.title = newTitle
        updateRecipe.instructions = newInstructions
        updateRecipe.calories = newCals
        updateRecipe.cookTime = newCookTime
        RecipeCategoryController.sharedInstance.save()
        
    }
    // Delete Recipe
    func delete(deleteRecipe: Recipe, from category: RecipeCategory) {
        guard let index = category.recipes.firstIndex(of: deleteRecipe) else {return}
        category.recipes.remove(at: index)
        RecipeCategoryController.sharedInstance.save()
    }
    
    func toggleFavorite(for recipe: Recipe) {
        recipe.isFavorite.toggle()
        RecipeCategoryController.sharedInstance.save()
    }
    
} // End of Class
