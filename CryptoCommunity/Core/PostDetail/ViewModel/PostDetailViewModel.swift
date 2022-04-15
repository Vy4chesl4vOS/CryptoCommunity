//
//  PostDetailViewModel.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 14.04.2022.
//

import Foundation

class PostDetailViewModel : ObservableObject {
    @Published var coins = [Coin]()
    let coinName: String
    
    var coin: Coin {
        return coins.filter{$0.name == coinName}.first!
    }
    
    init (coinName: String) {
        self.coinName = coinName
        self.fetchCrypto()
    }
    
    func fetchCrypto () {
        NetworkManager.shared.fetchCrypto { coins in
            self.coins = coins
        }
    }
}

