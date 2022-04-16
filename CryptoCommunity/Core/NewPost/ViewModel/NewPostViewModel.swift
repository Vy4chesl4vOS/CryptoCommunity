//
//  NewPostViewModel.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 13.04.2022.
//

import Foundation
import Firebase

class NewPostViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var pickedCoin: Coin?
    @Published var postText: String = ""
    @Published var didPostUpload = false
    
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
            postService.publishPost(coinName: pickedCoin.name, coinImage: pickedCoin.image, coinSymbol: pickedCoin.symbol, coinPrice: pickedCoin.currentPrice.convertCurrency(), text: postText) { complete in
                self.didPostUpload = true
                self.updatePostsCount()
                print("Post uploaded")
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
