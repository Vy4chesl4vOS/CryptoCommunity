//
//  AllCurrencyView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 10.04.2022.
//

import SwiftUI

struct AllCurrencyView: View {
    @StateObject var viewModel = AllCurrencyViewModel()
    
    var body: some View {
        VStack {
            FindSearchBarView(text: $viewModel.searchText, placeholder: "Search crypto")
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.searchCoins) { coin in
                        NavigationLink {
                            CryptoDetailView(coin: coin)
                        } label: {
                            CurrencyRowView(coin: coin, index: Int(coin.marketCapRank ?? 0.0))
                        }

                    }
                }
            }
        }
        .background(.gray.opacity(0.1))
    }
}

struct AllCurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        AllCurrencyView()
    }
}
