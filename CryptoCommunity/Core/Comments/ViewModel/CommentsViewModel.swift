//
//  CommentsViewModel.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 17.04.2022.
//

import Foundation
import Firebase

class CommentsViewModel : ObservableObject {
    
    @Published var text = ""
    @Published var comments = [Comment]()
    let post: Post
    
    let postService = PostsService()
    let userService = UserService()
    
    init (post: Post) {
        self.post = post
        self.fetchComments()
    }
    
    func uploadComments () {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        if !text.isEmpty && text.count > 5 {
            postService.uploadComment(uid: uid, text: text, post: post) { complet in
                if complet {
                    print("Complete upload comment")
                    self.text = ""
                }
            }
        }
    }
    
    func fetchComments () {
        postService.fetchComments(post: post) {[weak self] comments in
            self?.comments = comments
            
            for i in 0..<comments.count {
                let uid = comments[i].uid
                
                self?.userService.fetchUser(with: uid) { user in
                    self?.comments[i].user = user
                }
            }
        }
    }
}
