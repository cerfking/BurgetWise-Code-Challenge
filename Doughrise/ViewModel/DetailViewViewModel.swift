//
//  DetainViewViewModel.swift
//  Doughrise
//
//  Created by Sebastian on 4/30/24.
//

import Foundation
class DetailViewViewModel: ObservableObject {
    @Published var expenses: [Expense] = []

    init() {
        loadExpenses()
    }

    func loadExpenses() {
        DatabaseManager.shared.getExpenses { [weak self] fetchedExpenses in
            DispatchQueue.main.async {
                self?.expenses = fetchedExpenses
            }
        }
    }
}
