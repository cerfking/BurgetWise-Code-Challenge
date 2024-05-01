//
//  HomeView.swift
//  Doughrise
//
//  Created by Sebastian on 4/29/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestoreSwift
import FirebaseFirestore
import Foundation
import FirebaseStorage
struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Color(red: 101/255, green: 154/255, blue: 235/255))
                        .ignoresSafeArea(.container)
                        .frame(height: 189)
                    Spacer()
                }
                
                DetailView()
                NavigationLink(destination: AddExpenseView()) {
                    Image("Button")
                }
                .padding(.leading, 260)
                .padding(.top,570)
               
               
                
                
            }
            
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Image("Vector")
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Image("Share")
                           
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Image("Group")
                            .padding()
                    }
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("April 2022")
                                .font(.navTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Image("arrow")
                        }
                        
                    }
                    
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(Color(red: 101/255, green: 154/255, blue: 235/255), for: .navigationBar)
                
        }
        
        
    }
}

#Preview {
    HomeView()
}
