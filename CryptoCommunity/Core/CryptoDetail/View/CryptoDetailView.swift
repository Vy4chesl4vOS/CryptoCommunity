//
//  CryptoDetailView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 12.04.2022.
//

import SwiftUI
import SwiftUICharts

struct CryptoDetailView: View {
    @ObservedObject var viewModel: CryptoDetailViewModel
    
    let coin: Coin
    let chartsStyle = ChartStyle(backgroundColor: .gray.opacity(0.001), accentColor: .yellow, gradientColor: GradientColor(start: Colors.GradientUpperBlue, end: Colors.OrangeEnd), textColor: Color.black, legendTextColor: Color.black, dropShadowColor: .yellow)
    
    init(coin: Coin) {
        self.coin = coin
        self.viewModel = CryptoDetailViewModel(coinSymbol: coin.symbol)
    }
    
    var body: some View {
        VStack {
            VStack {
                Text("\(coin.currentPrice.convertCurrency())")
                    .foregroundColor(.black)
                    .fontWeight(.heavy)
                    .font(.title)
                Text("#\(Int(coin.marketCapRank ?? 0.0))")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            LineView(data: coin.sparklineIn7D?.price ?? [], style: chartsStyle)
                    .padding(.horizontal, 15)
            ZStack(alignment: .topLeading) {
                Color.white
                    .clipShape(RoundedShapeTop())
                    .shadow(color: .gray, radius: 5)
                .ignoresSafeArea()
                VStack {
                    Text("Market statistic")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.title2)
                        .padding(.top, 20)
                        .shadow(color: .gray.opacity(0.3), radius: 3)
                    Divider()
                        .padding()
                    ScrollView {
                        LazyVStack(spacing: 20) {
                            infoString(titleText: "Market capitalization", infoText: "\((coin.marketCap ?? 0.0).convertCurrency())", color: .black)
                            
                            infoString(titleText: "Hight 24H", infoText: "\((coin.high24H ?? 0.0).convertCurrency())", color: .black)
                            
                            infoString(titleText: "Low 24H", infoText: "\((coin.low24H ?? 0.0).convertCurrency())", color: .black)
                            
                            infoString(titleText: "Change 24H", infoText: "\((coin.priceChange24H ?? 0.0).convertCurrency())", color: String(coin.priceChange24H ?? 0.0).contains("-") ? .red : .green)
                            
                            Button {
                                viewModel.didCoinLiked ? viewModel.unlikeCoin(coinSymbol: coin.symbol) : viewModel.likeCoin(coinName: coin.name, coinSymbol: coin.symbol, coinImage: coin.image)
                            } label: {
                                Image(systemName: "suit.heart.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(viewModel.didCoinLiked ? .red : .gray)
                            }

                        }
                    }
                }

            }
        }
        .background(.gray.opacity(0.1))
        .navigationTitle("\(coin.name)(\(coin.symbol.uppercased()))")


    }
}

struct infoString: View {
    let titleText: String
    let infoText: String
    let color: Color
    var body: some View {
        HStack {
            Text(titleText)
                .font(.title3)
                .foregroundColor(.gray)
                .fontWeight(.medium)
            Spacer()
            Text(infoText)
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(color)
                .multilineTextAlignment(.trailing)
        }
        .padding(.horizontal, 20)
    }
}


