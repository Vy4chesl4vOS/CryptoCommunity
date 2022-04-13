//
//  UserRowView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 10.04.2022.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user: User
    var body: some View {
        HStack {
            KFImage(URL(string: user.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack {
                Text("\(user.username)")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
            }
            Spacer()
            Text("\(user.posts)")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
        }
        .padding(.vertical)
        .padding(.horizontal, 15)

    }
}

