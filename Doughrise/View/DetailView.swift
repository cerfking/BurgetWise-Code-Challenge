//
//  DetailView.swift
//  Doughrise
//
//  Created by Sebastian on 4/30/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestoreSwift
import FirebaseFirestore
import Foundation
import FirebaseStorage
struct DetailView: View {
   // @State var expenses: [Expense] = []
    @StateObject private var viewModel = DetailViewViewModel()
   // var budgets: [Budget] = []
//    init(expenses: [Expense]) {
//        self.expenses = expenses
//        DatabaseManager.shard.getExpenses()
//    }
    
    var body: some View {
        let totalSpent = viewModel.expenses.reduce(0) { $0 + $1.spent }
        let totalBudget = viewModel.expenses.reduce(0) { $0 + $1.budget }
        let widthFactor = totalBudget > 0 ? min(Double(totalSpent) / Double(totalBudget), 1) : 0
        ScrollView {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                    .border(Color(red: 91/255, green: 98/255, blue: 205/255), width: 0.22)
                    .shadow(color: .black, radius: 4, x: 0, y: 0)
                    .frame(width: 348)
                    .padding(.top, 8)
                    //.padding(.bottom, 8)
                
                
                VStack {
                    Text("$\(totalBudget - totalSpent)")
                        .font(.remainBudget)
                        .bold()
                        .foregroundStyle(.green)
                        .padding(.top)
                    Text("Remaining in Budget")
                        .font(Font.custom("Avenir Next", size: 13))
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(red: 221/255, green: 221/255, blue: 221/255))
                            .frame(width: 323.71, height: 32)
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(red: 83/255, green: 189/255, blue: 113/255))
                            .frame(width: CGFloat(widthFactor) * 323.71 , height: 32)
                    }
                        
                    
                    
                    HStack {
                        Text("Spent:")
                            .font(Font.custom("Avenir Next", size: 13))
                        Text("$\(totalSpent)")
                            .font(Font.custom("Avenir Next", size: 19))
                            .fontWeight(.medium)
                            .padding(.trailing)
                        Text("Budget:")
                            .font(Font.custom("Avenir Next", size: 13))
                        Text("$\(totalBudget)")
                            .font(Font.custom("Avenir Next", size: 19))
                            .fontWeight(.medium)
                    }
                    ForEach(viewModel.expenses, id: \.id) { expense in
                        CellView(expense: Expense(id: expense.id, category: expense.category, spent: expense.spent, budget: expense.budget))
                            .frame(width: 348, height: 60)
                            .padding(.top)
                    }
                    
                    Spacer()
                }
               
            }
        }
        .onAppear {
            viewModel.loadExpenses()
        }

        
    }
}

#Preview {
    DetailView()
}
