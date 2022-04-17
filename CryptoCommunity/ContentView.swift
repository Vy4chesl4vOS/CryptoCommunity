//
//  ContentView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 09.04.2022.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                if UserDefaults.standard.bool(forKey: "page") {
                    LoginView()
                        .navigationBarHidden(true)
                } else {
                    PageView()
                        .navigationBarHidden(true)
                }
            } else {
                MainTabView()
                    .navigationBarTitleDisplayMode(.inline)
                    .environmentObject(viewModel)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            if let user = viewModel.currentUser {
                                NavigationLink {
                                    ProfileView(user: user)
                                        .navigationBarHidden(true)

                                }
                                     label: {
                                        KFImage(URL(string: user.imageUrl))
                                            .resizable()
                                            .scaledToFill()
                                            .clipShape(Circle())
                                            .frame(width: 32, height: 32)
                                    }

                            }

                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
