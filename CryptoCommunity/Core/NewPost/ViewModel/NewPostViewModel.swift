//
//  NewPostViewModel.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 13.04.2022.
//

import Foundation


class NewPostViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var pickedCoin: Coin?
    
    init() {
        self.fetchCrypto()
    }
    
    func fetchCrypto () {
        NetworkManager.shared.fetchCrypto { coins in
            self.coins = coins
            self.pickedCoin = coins[0]
        }
    }
}
