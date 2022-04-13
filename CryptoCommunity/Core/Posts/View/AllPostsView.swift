//
//  AllPostsView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 10.04.2022.
//

import SwiftUI

struct AllPostsView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<15) { _ in
                    PostRowView()
                }
            }
        }
    }
}

struct AllPostsView_Previews: PreviewProvider {
    static var previews: some View {
        AllPostsView()
    }
}
