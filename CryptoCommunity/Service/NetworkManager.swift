//
//  NetworkManager.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 11.04.2022.
//

import Foundation
import SwiftUI

class NetworkManager {
    static let shared = NetworkManager()
    
    private let urlString: String = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
    
    
    func fetchCrypto (completion: @escaping ([Coin]) -> Void) {
        let decoder = JSONDecoder()
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil {
                DispatchQueue.main.async {
                    let coins = try! decoder.decode([Coin].self, from: data!)
                    completion(coins)
                    }
            }
        }.resume()
    }
}
