//
//  AuthViewModel.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 10.04.2022.
//

import Foundation
import Firebase
import UIKit

class AuthViewModel : ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var userEndRegistration = false
    @Published var currentUser: User?
    
    @Published var errorTypeLogin = ""
    @Published var errorTypeRegister = ""
    
    private var showPhotoSelectorSession: FirebaseAuth.User?
    private let userSerive = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func registerUser(email: String, password: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            if let error = error {
                print("Error register \(error.localizedDescription)")
                return
            }
            
            print("Register done")
            guard let user = result?.user else { return }
            self?.showPhotoSelectorSession = user
            
            let data = ["email" : email, "username": username.lowercased(), "uid": user.uid, "posts": 0] as [String: Any]
            Firebase.Firestore.firestore().collection("users").document(user.uid).setData(data) { error in
                if let error = error {
                    print("Eror store data \(error.localizedDescription)")
                    self?.errorTypeRegister = error.localizedDescription
                    return
                }
                
                self?.userEndRegistration = true
            }
        }
    }
    
    func loginUser(email: String, password: String) {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                print("Error login \(error.localizedDescription)")
                self?.errorTypeLogin = error.localizedDescription
                return
            }
        
            print("Login done")
            guard let user = result?.user else { return }
            self?.userSession = user
            self?.fetchUser()
        }
    }
    
    func resetPassword (email: String) {
        Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func signOut () {
        try? Firebase.Auth.auth().signOut()
        self.userSession = nil
    }
    
    func uploadImageData(image: UIImage) {
        guard let uid = showPhotoSelectorSession?.uid else { return }
        
        ImageUpload.uploadImage(image: image) { url in
            Firebase.Firestore.firestore().collection("users").document(uid).updateData(["imageUrl" : url]) {[weak self] _ in
                self?.userSession = self?.showPhotoSelectorSession
                self?.fetchUser()
                self?.userEndRegistration = false
            }
        }
        
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        userSerive.fetchUser(with: uid) {[weak self] user in
            self?.currentUser = user
        }
    }
    
    
    
}
