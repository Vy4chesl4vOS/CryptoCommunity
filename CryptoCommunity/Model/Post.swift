//
//  Post.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 13.04.2022.
//

import Foundation
import FirebaseFirestoreSwift

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let text: String
    let coinName: String
    let coinSymbol: String
    let coinImage: String
    let coinPrice: String
    let uid: String
    
    var user: User?
}
