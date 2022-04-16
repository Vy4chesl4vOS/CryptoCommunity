//
//  PostDetailView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 14.04.2022.
//

import SwiftUI

struct PostDetailView: View {
    @Environment(\.presentationMode) var mod
//    @ObservedObject var viewModel: PostDetailViewModel
    let post: Post
    
    init (post: Post) {
        self.post = post
//        self.viewModel = PostDetailViewModel(coinName: post.coin)
    }
    
    var body: some View {
        VStack {
            HeaderView(title1: post.coinName, title2: "@\(post.user?.username ?? "")")
            CurrencyPostRowView(coinImage: post.coinImage, coinSymbol: post.coinSymbol, coinName: post.coinName, coinPrice: post.coinPrice)
            ScrollView {
                Text(post.text)
                    .padding()
                    .multilineTextAlignment(.leading)
                Spacer()
            }.overlay(alignment: .bottom) {
                Button {
                    mod.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "multiply")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding()
                        .background(.red.opacity(0.7))
                        .clipShape(Circle())
                }
                .padding(.bottom, 30)
            }
        }
        .ignoresSafeArea()
    }
}

