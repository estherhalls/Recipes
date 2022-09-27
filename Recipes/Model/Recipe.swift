//
//  Recipe.swift
//  Recipes
//
//  Created by Esther on 9/27/22.
//

import Foundation
class Recipe: Codable {
    var title: String
    var cookTime: Int
    var calories: Int?
    var instructions: String
    let id: UUID
    var isFavorite: Bool
    
    init(title: String, cookTime: Int, calories: Int?, instructions: String, id: UUID = UUID(), isFavorite: Bool = false) {
        self.title = title
        self.cookTime = cookTime
        self.calories = calories
        self.instructions = instructions
        self.id = id
        self.isFavorite = isFavorite
        
    }
} // End of Class

// Extend Recipe to ADOPT the Equatable Protocol
extension Recipe: Equatable {
    // CONFORM to Equatable Protocol
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.id == rhs.id
    }
} // End of Extension
