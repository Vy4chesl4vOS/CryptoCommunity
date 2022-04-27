//
//  AllCurrencyViewModel.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 11.04.2022.
//

import Foundation

class AllCurrencyViewModel : ObservableObject {
    @Published var coins = [Coin]()
    @Published var searchText = ""
    
    
    var searchCoins: [Coin] {
        if searchText.isEmpty {
            return coins
        } else {
            return coins.filter{
                $0.name.searchFilter().contains(searchText.searchFilter()) ||
                $0.id.searchFilter().contains(searchText.searchFilter()) ||
                $0.symbol.searchFilter().contains(searchText.searchFilter())
            }
        }
    }
        
    init () {
        self.fetchCrypto()
    }
    
    func fetchCrypto () {
        NetworkManager.shared.fetchCrypto {[weak self] coins in
            self?.coins = coins
        }
    }
}
