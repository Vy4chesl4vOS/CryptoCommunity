//
//  CurrencyPostRowView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 15.04.2022.
//

import SwiftUI
import Kingfisher

struct CurrencyPostRowView: View {
    let coinImage: String
    let coinSymbol: String
    let coinName: String
    let coinPrice: String?
    
    var body: some View {
        HStack() {
            HStack() {
                KFImage(URL(string: coinImage))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())

            }
            VStack(alignment: .leading ,spacing: 5) {
                Text(coinName)
                    .fontWeight(.semibold)
                    .font(.title2)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                Text(coinSymbol.uppercased())
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            if let coinPrice = coinPrice {
                Text("\(coinPrice)")
                    .foregroundColor(.green)
                    .fontWeight(.medium)
            }
        }
        .padding(.vertical)
        .padding(.horizontal, 15)
    }
}
