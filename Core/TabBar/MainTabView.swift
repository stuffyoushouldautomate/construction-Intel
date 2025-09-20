//
//  MainTabView.swift
//  AirBnb
//
//  Created by Kumaran Nathan on 2/3/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            CompaniesView()
                .tabItem { Label("Companies", systemImage: "building.2") }
            IntelFeedView()
                .tabItem { Label("Intel", systemImage: "newspaper") }
            NavigationStack { ChatView() }
                .tabItem { Label("Chat", systemImage: "bubble.left.and.text.bubble.right") }
            ProfileView()
                .tabItem { Label("Settings", systemImage: "gear") }
        }
    }
}

#Preview {
    MainTabView()
}
