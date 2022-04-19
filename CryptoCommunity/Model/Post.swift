//
//  Post.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 13.04.2022.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let text: String
    let coinName: String
    let coinSymbol: String
    let coinImage: String
    let coinPrice: String
    let uid: String
    let timestamp: Timestamp
    let image: String?
    
    var user: User?
}
