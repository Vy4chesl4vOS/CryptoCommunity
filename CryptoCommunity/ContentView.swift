//
//  ContentView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 09.04.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
                    .navigationBarHidden(true)
            } else {
                MainTabView()
                    .navigationBarTitleDisplayMode(.inline)
                    .environmentObject(viewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
