//
//  UserService.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 11.04.2022.
//

import Foundation
import Firebase

struct UserService {
    func fetchUser(with uid: String, completion: @escaping (User) -> Void) {
        Firebase.Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                print("Fetch user error \(error.localizedDescription)")
                return
            }
            guard let user = try? snapshot?.data(as: User.self) else { return }
            completion(user)
            print("DEBUG: userdata is \(user.username) email \(user.email)")
        }
    }
    
    func fetchUsers(completion: @escaping ([User]) -> Void) {
        Firebase.Firestore.firestore().collection("users").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let users: [User] = documents.compactMap({try? $0.data(as: User.self)})
            completion(users)
        }
    }
    
}
