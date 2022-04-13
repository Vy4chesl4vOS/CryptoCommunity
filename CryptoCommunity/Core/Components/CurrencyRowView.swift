//
//  CurrencyRowView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 10.04.2022.
//

import SwiftUI
import Kingfisher

struct CurrencyRowView: View {
    let coin: Coin
    let index: Int
    
    init(coin: Coin, index: Int) {
        self.coin = coin
        self.index = index
    }
    var body: some View {
        HStack() {
            HStack() {
                Text("\(index)")
                    .foregroundColor(.gray)
                KFImage(URL(string: coin.image))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())

            }
            VStack(alignment: .leading ,spacing: 5) {
                Text(coin.name)
                    .fontWeight(.semibold)
                    .font(.title2)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                Text(coin.symbol.uppercased())
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("\(coin.currentPrice)$")
                .foregroundColor(.green)
                .fontWeight(.medium)
        }
        .padding(.vertical)
        .padding(.horizontal, 15)
    }
}
