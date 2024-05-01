//
//  DatabaseManager.swift
//  Doughrise
//
//  Created by Sebastian on 4/30/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestoreSwift
import FirebaseFirestore
import FirebaseStorage
class DatabaseManager {
    static let shared = DatabaseManager()
    func getExpenses(completion: @escaping ([Expense]) -> Void) {
        var expenses:[Expense] = []
        let db = Firestore.firestore()
        db.collection("Expense").getDocuments {snapshot, error in
            if let error = error {
                completion([])
            } else {
                for document in snapshot!.documents {
                    let documentData = document.data()
                    let expanse = Expense(id: document.documentID, category: documentData["category"] as? String ?? "", spent: documentData["spent"] as? Int ?? 0, budget: documentData["budget"] as? Int ?? 0)
                    expenses.append(expanse)
                    
                }
                completion(expenses)
            }
        }
       
    }
    

    func updateSpentAmount(category: String, spentToAdd: Int, completion: @escaping (Bool) -> Void) {
        let db = Firestore.firestore()
        // Query for documents with the specified category
        let query = db.collection("Expense").whereField("category", isEqualTo: category)
        
        query.getDocuments { snapshot, error in
            guard let snapshot = snapshot, error == nil else {
                completion(false)
                return
            }
            
            // Firestore transactions to ensure data integrity
            let batch = db.batch()
            
            snapshot.documents.forEach { document in
                let documentRef = document.reference
                let currentSpent = document.data()["spent"] as? Int ?? 0
                let newSpent = currentSpent + spentToAdd
                batch.updateData(["spent": newSpent], forDocument: documentRef)
            }
            
            // Commit the batch
            batch.commit { err in
                if let err = err {
                    completion(false)
                } else {
                    completion(true)
                }
            }
        }
    }

}
