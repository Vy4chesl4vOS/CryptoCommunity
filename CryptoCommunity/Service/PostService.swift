//
//  PostService.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 13.04.2022.
//

import Foundation
import Firebase

struct PostsService {
    let service = UserService()
    var currentUser: User?
    
    func publishPost(coin: String, text: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let data = ["coin": coin, "text": text, "uid": uid] as [String : Any]
        Firebase.Firestore.firestore().collection("posts").document().setData(data) { error in
            if let error = error {
                print("Error upload post \(error)")
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    func updataPostsConut (user: User) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        print(uid)
        Firebase.Firestore.firestore().collection("users").document(uid).updateData(["posts": user.posts + 1])
    }
    
    func fetchPosts(completion: @escaping([Post]) -> Void) {
        Firebase.Firestore.firestore().collection("posts").getDocuments { snapshot, _ in
            guard let docuemnts = snapshot?.documents else { return }
            let posts: [Post] = docuemnts.compactMap{try? $0.data(as: Post.self)}
            completion(posts)
        }
    }
    
    func fetchUserPosts (uid: String, completion: @escaping([Post]) -> Void) {
        Firebase.Firestore.firestore().collection("posts").whereField("uid", isEqualTo: uid).getDocuments { snapshots, _ in
            guard let documents = snapshots?.documents else { return }
            let posts: [Post] = documents.compactMap{try? $0.data(as: Post.self)}
            completion(posts)
        }
    }
}
