//
//  CellView.swift
//  Doughrise
//
//  Created by Sebastian on 4/30/24.
//

import SwiftUI

struct CellView: View {
    let expense: Expense
    var body: some View {
        let widthFactor = expense.budget > 0 ? min(Double(expense.spent) / Double(expense.budget), 1) : 0
        VStack {
            HStack {
                Image(expense.category)
                    .padding(.top)
                    .padding(.horizontal)
                Text(expense.category)
                    .font(Font.custom("Avenir Next", size: 16))
                    .fontWeight(.medium)
                    .padding(.top)
                    
                Spacer()
                VStack(alignment: .trailing) {
                    Text("$\(expense.spent) of $\(expense.budget)")
                        .font(Font.custom("Avenir Next", size: 16))
                        .fontWeight(.medium)
                        .padding(.top)
                        .padding(.trailing)
                    Text("$\(expense.budget - expense.spent) left")
                        .padding(.trailing)
                }
                
            }
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 8)
                Rectangle()
                    .foregroundColor(ColorDic[expense.category])
                    .frame(width: CGFloat(widthFactor) * 348, height: 8)
            }
            
        }
    }
}

#Preview {
    CellView(expense: Expense(id: "1", category: "Food", spent: 100, budget: 200))
}
