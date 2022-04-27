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
    @Published var likedCoins = [LikedCoin]()
    
    let service = PostsService()
    let userService = UserService()
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchUserPosts()
        self.fetchLikedCoins()
    }
    
    func fetchUserPosts () {
        guard let uid  = user.id else { return }
        self.service.fetchUserPosts(uid: uid) {[weak self] posts in
            self?.userPosts = posts
            
            for i in 0..<posts.count {
                self?.userPosts[i].user = self?.user
            }
        }
    }
    
    func fetchLikedCoins () {
        guard let uid = user.id else { return }
        userService.fetchCoinLikes(uid: uid) { [weak self] coins in
            self?.likedCoins = coins
        }
    }
    
}
