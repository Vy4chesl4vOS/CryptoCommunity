//
//  FindSearchBarView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 10.04.2022.
//

import SwiftUI

struct FindSearchBarView: View {
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        HStack {
            TextField("\(placeholder)...", text: $text)
                .padding(15)
                .padding(.horizontal, 24)
                .background(Color(.white))
                .cornerRadius(30)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
        }
        .padding(.horizontal, 20)
    }
}

struct FindSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        FindSearchBarView(text: .constant(""), placeholder: "Search cryptos")
    }
}
