//
//  UserCommentRowView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 17.04.2022.
//

import SwiftUI
import Kingfisher

struct UserCommentRowView: View {
    let comment: Comment
    var body: some View {
        HStack(alignment: .top) {
            KFImage(URL(string: comment.user?.imageUrl ?? ""))
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text("\(comment.user?.username ?? "")")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                Text("\(comment.text)")
                    .foregroundColor(.gray)
                    .font(.body)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }
        .padding(.vertical)
        .padding(.horizontal, 15)

    }
}

