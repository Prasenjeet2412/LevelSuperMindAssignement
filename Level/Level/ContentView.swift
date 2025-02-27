//
//  ContentView.swift
//  Level
//
//  Created by Prasenjeet Pandagale on 26/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedSegment = "My Library"
    let segments = ["My Library", "Insights"]
    var body: some View {
        TabView {
                    Today()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    
                    Explore()
                        .tabItem {
                            Label("Explore", systemImage: "magnifyingglass")
                        }
                    
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person")
                        }
                }
        .background(Color(red: 15, green: 6, blue: 34))
    }
    
}

#Preview {
    ContentView()
}
