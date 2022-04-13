//
//  User.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 11.04.2022.
//

import Foundation
import FirebaseFirestoreSwift

struct User : Identifiable, Decodable {
    @DocumentID var id: String?
    let email: String
    let username: String
    let imageUrl: String
    let posts: Int
}
