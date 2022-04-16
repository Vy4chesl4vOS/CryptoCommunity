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

extension UserService {
    
    func likeCrypto(coinName: String, coinSymbol: String, coinImage: String, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let data = ["coinName": coinName, "coinSymbol": coinSymbol, "coinImage": coinImage]
        Firebase.Firestore.firestore().collection("users").document(uid).collection("user-like").document(coinSymbol).setData(data)
        completion()
    }
    
    func checkIfCryptoLiked(coinSymbol: String, completion: @escaping (Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }

        Firestore.firestore().collection("users").document(uid).collection("user-like").document(coinSymbol).getDocument { snapshot, _ in
            guard let snapshot = snapshot else { return }
            completion(snapshot.exists)
        }
    }
    
    func unlikeCrypto(coinSymbol: String, completion: @escaping () -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Firebase.Firestore.firestore().collection("users").document(uid).collection("user-like").document(coinSymbol).delete()
        completion()
    }
    
    func fetchCoinLikes (uid: String ,completion: @escaping([LikedCoin]) -> Void) {
        Firebase.Firestore.firestore().collection("users").document(uid).collection("user-like").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let coins: [LikedCoin] = documents.compactMap({try? $0.data(as: LikedCoin.self)})
            completion(coins)
        }
    }
    
}
