//
//  Comment.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 17.04.2022.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Comment : Identifiable, Decodable {
    @DocumentID var id: String?
    let text: String
    let uid: String
    let timestamp: Timestamp
    
    var user: User?
}
