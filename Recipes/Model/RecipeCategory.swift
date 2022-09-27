//
//  RecipeCategory.swift
//  Recipes
//
//  Created by Esther on 9/27/22.
//

import Foundation
class RecipeCategory: Codable {
    // The recipe category object will hold the recipes objects
    var title: String
    var recipes: [Recipe]
    let id: UUID // this makes it easier to keep track of the instances when extending equatable
    
    init(title: String, recipes: [Recipe] = [], id: UUID = UUID()){
        self.title = title
        self.recipes = recipes
        self.id = id
    }
    
} // End of Class

extension RecipeCategory: Equatable {
    static func == (lhs: RecipeCategory, rhs: RecipeCategory) -> Bool{
        return lhs.id == rhs.id
    }
} // End of Extension
