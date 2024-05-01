//
//  ContentView.swift
//  Doughrise
//
//  Created by Sebastian on 4/28/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
          
                HomeView()
            
            .tabItem {
                Image("home")
                    .renderingMode(.template)
                Text("Home")
            }
            Text("123")
                .tabItem {
                    Image("trends")
                        .renderingMode(.template)
                    Text("Trends")
                }
            Text("123")
                .tabItem {
                    Image("transactions")
                        .renderingMode(.template)
                    Text("Transactions")
                }
            Text("123")
                .tabItem {
                    Image("community")
                        .renderingMode(.template)
                    Text("Community")
                }
            Text("123")
                .tabItem {
                    Image("profile")
                        .renderingMode(.template)
                    Text("Profile")
                }
            
        }
    }
}

#Preview {
    ContentView()
}
