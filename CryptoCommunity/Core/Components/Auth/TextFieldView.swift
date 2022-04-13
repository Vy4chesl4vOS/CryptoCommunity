//
//  TextFieldView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 09.04.2022.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var text: String
    let placeHolder: String
    let imageName: String
    let imageColor: Color
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .font(.body)
                .padding(8)
                .background(imageColor.opacity(0.7))
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
            TextField(placeHolder, text: $text)
                .frame(width: 270, height: 60)
                .font(.body)
                .textInputAutocapitalization(.never)

        }
        .background(.white)
        .cornerRadius(30)

    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(text: .constant(""), placeHolder: "Example@gmail.com", imageName: "person", imageColor: .yellow)
            .previewDevice("iPhone 13")
    }
}
