//
//  NewPostViewModel.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 13.04.2022.
//

import Foundation
import Firebase
import UIKit

class NewPostViewModel: ObservableObject {
    
    @Published var coins = [Coin]()
    @Published var pickedCoin: Coin?
    @Published var postText: String = ""
    @Published var didPostUpload = false
    @Published var image: UIImage?
    
    let postService = PostsService()
    let userService = UserService()
        
    init() {
        self.fetchCrypto()
    }
    
    func fetchCrypto () {
        NetworkManager.shared.fetchCrypto { coins in
            self.coins = coins
            self.pickedCoin = coins[0]
        }
    }
    
    func uploadPost() {
        guard let pickedCoin = pickedCoin else { return }
        if !postText.isEmpty && postText.count > 40 {
            if let image = image {
                ImageUpload.uploadImage(image: image) { url in
                    self.postService.publishPost(image: url ,coinName: pickedCoin.name, coinImage: pickedCoin.image, coinSymbol: pickedCoin.symbol, coinPrice: pickedCoin.currentPrice.convertCurrency(), text: self.postText) {[weak self] complete in
                        self?.didPostUpload = true
                        self?.updatePostsCount()
                        print("Post uploaded")
                    }
                }
            } else {
                postService.publishPost(image: nil ,coinName: pickedCoin.name, coinImage: pickedCoin.image, coinSymbol: pickedCoin.symbol, coinPrice: pickedCoin.currentPrice.convertCurrency(), text: postText) {[weak self] complete in
                    self?.didPostUpload = true
                    self?.updatePostsCount()
                    print("Post uploaded")
                }
            }
        }
    }
    
    func updatePostsCount() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        userService.fetchUser(with: uid) { user in
            self.postService.updataPostsConut(user: user)

        }
    }

}
