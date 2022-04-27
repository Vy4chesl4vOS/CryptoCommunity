//
//  CryptoDetailViewModel.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 16.04.2022.
//

import Foundation

class CryptoDetailViewModel: ObservableObject {
    
    @Published var didCoinLiked = false
    let service = UserService()
    
    init (coinSymbol: String) {
        checkIsCoinLike(coinSymbol: coinSymbol)
    }
    
    func likeCoin (coinName: String, coinSymbol: String, coinImage: String) {
        service.likeCrypto(coinName: coinName, coinSymbol: coinSymbol, coinImage: coinImage) { [weak self] in
            self?.didCoinLiked = true
        }
    }
    
    func unlikeCoin (coinSymbol: String) {
        service.unlikeCrypto(coinSymbol: coinSymbol) { [weak self] in
            self?.didCoinLiked = false
        }
    }
    
    func checkIsCoinLike (coinSymbol: String) {
        service.checkIfCryptoLiked(coinSymbol: coinSymbol) {[weak self] didLike in
            if didLike{
                self?.didCoinLiked = true
            } else {
                self?.didCoinLiked = false
            }
        }
    }
    
}
