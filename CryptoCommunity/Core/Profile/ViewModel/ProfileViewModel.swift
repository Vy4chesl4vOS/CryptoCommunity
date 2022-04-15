//
//  ProfileViewModel.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 15.04.2022.
//

import Foundation
import SwiftUI

class ProfileViewModel : ObservableObject {
    @Published var userPosts = [Post]()
    
    let service = PostsService()
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchUserPosts()
    }
    
    func fetchUserPosts () {
        guard let uid  = user.id else { return }
        self.service.fetchUserPosts(uid: uid) { posts in
            self.userPosts = posts
            
            for i in 0..<posts.count {
                self.userPosts[i].user = self.user
            }
        }
    }
    
}
