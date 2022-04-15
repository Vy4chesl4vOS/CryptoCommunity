//
//  PostRowView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 10.04.2022.
//

import SwiftUI
import Kingfisher

struct PostRowView: View {
    let post: Post
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                HStack() {
                    KFImage(URL(string: post.user?.imageUrl ?? ""))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                }
                VStack(alignment: .leading ,spacing: 5) {
                    Text("\(post.coin)")
                        .fontWeight(.semibold)
                        .font(.title2)
                        .foregroundColor(.black)
                    Text("From: \(post.user?.username ?? "")")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
     
            }
            .padding(.bottom, 15)

            Text("\(post.text)")
                .foregroundColor(.gray)
                .font(.caption)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
            Divider()
                .foregroundColor(.blue)
        }
        .padding(20)
    }
}

