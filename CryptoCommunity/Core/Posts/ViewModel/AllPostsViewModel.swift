//
//  AllPostsViewModel.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 14.04.2022.
//

import Foundation


class AllPostsViewModel : ObservableObject {
    
    @Published var posts = [Post]()
    @Published var searchText = ""
    
    let service = PostsService()
    let userService = UserService()
    
    var searchPosts: [Post] {
        if searchText.isEmpty {
            return posts
        } else {
            return posts.filter{
                $0.coinName.searchFilter().contains(searchText.searchFilter()) ||
                $0.user!.username.searchFilter().contains(searchText.searchFilter()) ||
                $0.coinSymbol.searchFilter().contains(searchText.searchFilter()) ||
                $0.text.searchFilter().contains(searchText.searchFilter())
            }
        }
    }
    
    init () {
        self.fetchPosts()
    }
    
    func fetchPosts () {
        service.fetchPosts {[weak self] posts in
            self?.posts = posts
            
            for i in 0..<posts.count {
                let uid = posts[i].uid
                
                self?.userService.fetchUser(with: uid) { user in
                    self?.posts[i].user = user
                }
            }
        }
    }
}
