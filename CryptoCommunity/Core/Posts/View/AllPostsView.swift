//
//  AllPostsView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 10.04.2022.
//

import SwiftUI

struct AllPostsView: View {
    @StateObject var viewModel = AllPostsViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.posts) { post in
                    NavigationLink {
                        PostDetailView(post: post)
                    } label: {
                        PostRowView(post: post)
                    }

                }
            }
        }
        .background(.gray.opacity(0.1))
    }
}

struct AllPostsView_Previews: PreviewProvider {
    static var previews: some View {
        AllPostsView()
    }
}
