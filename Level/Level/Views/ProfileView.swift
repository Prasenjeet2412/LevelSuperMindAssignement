//
//  ProfileView.swift
//  Level
//
//  Created by Prasenjeet Pandagale on 27/02/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedSegment = "My Library"
    let segments = ["My Library", "Insights"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // MARK: - Profile Header
                HStack {
                    Circle()
                        .fill(Color.green) // Profile image placeholder
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Sourav")
                            .font(.system(size: 20, weight: .bold))
                        
                        Text("Level Premium User")
                            .font(.system(size: 14))
                            .foregroundColor(Color.yellow)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "gearshape.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                
                // MARK: - Streak & League Section
                HStack {
                    streakBadge(icon: "flame.fill", count: "17", label: "Day Streak")
                    streakBadge(icon: "medal.fill", count: "#04", label: "Gold League")
                }
                .padding(.horizontal)
                
                // MARK: - Segmented Picker
                Picker("", selection: $selectedSegment) {
                    ForEach(segments, id: \.self) { segment in
                        Text(segment)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                // MARK: - Selected Section Content
                if selectedSegment == "My Library" {
                    myLibraryView
                } else {
                    insightsView
                }
                
                Text("Made Mindfully in 🇮🇳 ")
                
                Text("""
                     Clear Mind 
                     Better Performance
                    """)
                .font(.largeTitle)
            }
        }
        .background(Color("BGcolor"))
        .foregroundColor(.white)
    }
    
    // MARK: - Streak Badge
    private func streakBadge(icon: String, count: String, label: String) -> some View {
        VStack {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.orange)
            
            Text(count)
                .font(.title2)
                .bold()
            
            Text(label)
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(12)
    }
    
    // MARK: - My Library Section
    private var myLibraryView: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Recently Played Section
            VStack(alignment: .leading) {
                HStack {
                    Text("Recently Played")
                        .font(.system(size: 18, weight: .bold))
                    Spacer()
                    Text("See all")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<3) { _ in
                            VStack(alignment: .leading, spacing: 5) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue)
                                    .frame(width: 150, height: 100)
                                
                                Text("Meditation • 5 Mins")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                
                                Text("Workplace Anxiety")
                                    .font(.system(size: 16, weight: .bold))
                                
                                Text("Avi Arya")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                            .frame(width: 150)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            // Favorites, Downloads, Playlists, Journals
            VStack {
                libraryOption(icon: "heart.fill", title: "My Favorites")
                libraryOption(icon: "arrow.down.circle.fill", title: "Downloads")
                libraryOption(icon: "text.badge.plus", title: "My Playlists")
                libraryOption(icon: "book.fill", title: "My Journal Entries")
            }
            .background(Color.white.opacity(0.1))
            .cornerRadius(12)
            .padding(.horizontal)
        }
    }
    
    // MARK: - Library Option Row
    private func libraryOption(icon: String, title: String) -> some View {
        VStack {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                Text(title)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            Divider().background(Color.white.opacity(0.3))
        }
    }
    
    // MARK: - Insights Section (Placeholder)
    private var insightsView: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Insights content goes here...")
                .font(.title2)
                .foregroundColor(.gray)
                .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ProfileView()
}
