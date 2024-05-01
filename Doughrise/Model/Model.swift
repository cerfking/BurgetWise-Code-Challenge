//
//  Model.swift
//  Doughrise
//
//  Created by Sebastian on 4/30/24.
//

import Foundation
struct Expense: Codable, Identifiable {
    let id: String
    let category: String
    let spent: Int
    let budget: Int
    init(id: String, category: String, spent: Int, budget: Int) {
        self.id = id
        self.category = category
        self.spent = spent
        self.budget = budget
    }
}

struct Budget: Codable, Identifiable {
    let id: String
    let category: String
    let budget: Int
    init(id: String, category: String, budget: Int) {
        self.id = id
        self.category = category
        self.budget = budget
    }
}
