//
//  DoughriseApp.swift
//  Doughrise
//
//  Created by Sebastian on 4/28/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestoreSwift
import FirebaseFirestore
import Foundation
import FirebaseStorage
@main
struct DoughriseApp: App {
  
    init() {
        FirebaseApp.configure()
       
      
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
