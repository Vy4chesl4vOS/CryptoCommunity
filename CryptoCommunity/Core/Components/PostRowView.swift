//
//  PostRowView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 10.04.2022.
//

import SwiftUI

struct PostRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                HStack() {
                    Circle()
                        .frame(width: 50, height: 50)
                }
                VStack(alignment: .leading ,spacing: 5) {
                    Text("BTC")
                        .fontWeight(.semibold)
                        .font(.title2)
                    Text("From: Username")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
     
            }

            
            Divider()
                .foregroundColor(.blue)
            Text("This may be go away and start withakmThis may be go away and start withakmThis may be go away and start withakm star 1000$  go awa  go awa v go awa go awa go awa")
                .foregroundColor(.gray)
                .font(.caption)
                .padding()
                .lineLimit(3)
        }
        .padding(.vertical)
        .padding(.horizontal, 15)
    }
}

struct PostRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostRowView()
    }
}
