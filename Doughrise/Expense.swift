//
//  Expense.swift
//  Doughrise
//
//  Created by Sebastian on 4/30/24.
//

import Foundation
import SwiftData
@Model
class Expense {
    @Attribute(.unique) private var category: String
    private var spent: Int
    init(category: String, spent: Int) {
        self.category = category
        self.spent = spent
    }
}
