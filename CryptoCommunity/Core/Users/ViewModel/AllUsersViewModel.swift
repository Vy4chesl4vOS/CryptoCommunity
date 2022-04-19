//
//  AllUsersViewModel.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 12.04.2022.
//

import Foundation

class AllUsersViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    
    let userService = UserService()
    
    var searchUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            return users.filter{
                $0.username.searchFilter().contains(searchText.searchFilter()) ||
                $0.email.searchFilter().contains(searchText.searchFilter())
            }
        }
    }
    
    init () {
        self.fetchUsers()
    }
    
    func fetchUsers() {
        userService.fetchUsers { users in
            self.users = users
        }
    }
}
