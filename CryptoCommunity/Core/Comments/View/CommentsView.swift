//
//  CommentsView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 17.04.2022.
//

import SwiftUI

struct CommentsView: View {
    @ObservedObject var viewModel: CommentsViewModel
    let post: Post
    
    init (post: Post) {
        self.post = post
        viewModel = CommentsViewModel(post: post)
    }
    
    var body: some View {
        VStack {
            HeaderView(title1: "Comments", title2: "@\(post.user?.username ?? "")")
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.comments) { comment in
                        UserCommentRowView(comment: comment)
                    }
                }
            }
            HStack {
                Spacer()
                TextAreaPost(text: $viewModel.text, "Enter comment")
                    .frame(height: 40)
                    .padding(5)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(30)
                    .multilineTextAlignment(.leading)
                Button {
                    viewModel.uploadComments()
                } label: {
                    Image(systemName: "pencil.circle")
                        .font(.system(size: 40))
                        .foregroundColor(.blue)
                }

            }
            .padding()
                
        }
        .ignoresSafeArea()
    }
}

