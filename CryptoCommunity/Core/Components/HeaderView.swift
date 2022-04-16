//
//  HeaderView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 09.04.2022.
//

import SwiftUI

struct HeaderView: View {
    let title1: String
    let title2: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {Spacer()}
            Text(title1)
                .foregroundColor(.yellow)
                .font(.system(size: 40))
                .fontWeight(.heavy)
                .lineLimit(1)
            Text(title2)
                .foregroundColor(.white)
                .font(.system(size: 28))
                .fontWeight(.heavy)
        }
        .frame(height: 230)
        .padding(.horizontal, 50)
        .background(.blue)
        .clipShape(RoundedShape())
        .shadow(color: .gray, radius: 10)
    }
}

