//
//  AllPostsViewModel.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 14.04.2022.
//

import Foundation


class AllPostsViewModel : ObservableObject {
    @Published var posts = [Post]()
    
    let service = PostsService()
    let userService = UserService()
    
    init () {
        self.fetchPosts()
    }
    
    func fetchPosts () {
        service.fetchPosts { posts in
            self.posts = posts
            
            for i in 0..<posts.count {
                let uid = posts[i].uid
                
                self.userService.fetchUser(with: uid) { user in
                    self.posts[i].user = user
                }
            }
        }
    }
}
