//
//  CryptoCommunityApp.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 09.04.2022.
//

import SwiftUI
import Firebase

@main
struct CryptoCommunityApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .preferredColorScheme(.light)
            }
            .environmentObject(viewModel)
        }
    }
}

