//
//  LikedCoin.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 16.04.2022.
//

import Foundation
import FirebaseFirestoreSwift

struct LikedCoin: Identifiable, Decodable {
    @DocumentID var id: String?
    
    let coinName: String
    let coinSymbol: String
    let coinImage: String
}
