//
//  AddExpenseView.swift
//  Doughrise
//
//  Created by Sebastian on 4/30/24.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.presentationMode) var presentationMode  // Environment variable for managing view dismissal
    let categories = ["Food", "Shopping", "Transportation", "Education", "Groceries", "Housing"]
    @State private var selectedCategory = "Food"
    @State private var amount: Int = 0
    private var amountString: Binding<String> {
           Binding<String>(
               get: { String(self.amount) },  // Convert Int to String
               set: {
                   if let value = Int($0) {
                       self.amount = value  // Set the amount if the conversion is successful
                   }
               }
           )
       }
    


    var body: some View {
        NavigationStack {
            VStack {
                Picker("Please choose a color", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.wheel)
                HStack {
                    Text("Amout:")
                        .font(.remainBudget)
                        .padding()
                    TextField("Amount",text: amountString)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .keyboardType(.numberPad)  // Suggests numeric input
                                            
                }
                Button("Save Expense") {
                   
                    DatabaseManager.shared.updateSpentAmount(category: selectedCategory, spentToAdd: amount) { success in
                        if success {
                            print("Expense saved: Category \(selectedCategory) with amount \(amount)")
                            // Dismiss the view and return to the parent view
                            self.presentationMode.wrappedValue.dismiss()
                        } else {
                            print("save error")
                        }
                        
                    }
                   
                }
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                  
            }
            .navigationTitle("Add Expense")
        }
        
    }
}

#Preview {
    AddExpenseView()
}
