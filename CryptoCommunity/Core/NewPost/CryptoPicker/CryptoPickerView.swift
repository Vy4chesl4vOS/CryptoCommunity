//
//  CryptoPickerView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 13.04.2022.
//

import SwiftUI

struct CryptoPickerView: View {
    @EnvironmentObject var viewModel: NewPostViewModel
    @Environment(\.presentationMode) var mod
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.coins) { coin in
                    Button {
                        viewModel.pickedCoin = coin
                        mod.wrappedValue.dismiss()
                    } label: {
                        CurrencyRowView(coin: coin, index: Int(coin.marketCapRank ?? 0.0))
                    }

                }
            }
        }
        
    }
}

struct CryptoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoPickerView()
    }
}
