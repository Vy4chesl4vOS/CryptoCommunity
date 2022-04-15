//
//  NewPostView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 10.04.2022.
//

import SwiftUI

struct NewPostView: View {
    @State private var showCryptoPicker = false
    
    @StateObject var viewModel = NewPostViewModel()
    @Environment(\.presentationMode) var mod
    
    var body: some View {
        VStack {
            HeaderView(title1: "New post", title2: "Share your thinks with people.")
            if let coin = viewModel.pickedCoin {
                Button {
                    showCryptoPicker.toggle()
                } label: {
                    CurrencyRowView(coin: coin, index: Int(coin.marketCapRank ?? 0.0))
                }

            } else {
                Text("Check internet connection")
                    .foregroundColor(.black)
                    .font(.body)
                    .fontWeight(.bold)
            }
            TextAreaPost(text: $viewModel.postText, "Enter your text")
                .overlay (alignment: .bottom){
                    HStack {
                        Button {
                            mod.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "multiply")
                                .foregroundColor(.white)
                                .font(.title2)
                                .padding()
                                .background(.red.opacity(0.7))
                                .clipShape(Circle())
                        }

                        
                        Button {
                            viewModel.uploadPost()
                        } label: {
                            Text("Upload")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(.vertical, 16)
                                .padding(.horizontal, 50)
                                .background(.blue)
                                .cornerRadius(30)
                        }
                    }
                    .padding(.vertical, 30)

                }
 
        }
        .ignoresSafeArea()
        .background(.gray.opacity(0.1))
        .sheet(isPresented: $showCryptoPicker, onDismiss: nil) {
            CryptoPickerView()
                .environmentObject(viewModel)
        }
        .onReceive(viewModel.$didPostUpload) { success in
            if success {
                mod.wrappedValue.dismiss()
            }
        }
        
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
