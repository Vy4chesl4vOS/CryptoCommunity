//
//  AllUsersView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 10.04.2022.
//

import SwiftUI

struct AllUsersView: View {
    @StateObject var viewModel = AllUsersViewModel()
    
    var body: some View {
            VStack {
                FindSearchBarView(text: $viewModel.searchText, placeholder: "Search user")
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.searchUsers) { user in
                            NavigationLink {
                                ProfileView(user: user)
                                    .navigationBarHidden(true)
                            } label: {
                                UserRowView(user: user)
                            }

                        }
                    }
                }
            }
            .background(.gray.opacity(0.1))
    }
}

struct AllUsersView_Previews: PreviewProvider {
    static var previews: some View {
        AllUsersView()
    }
}
