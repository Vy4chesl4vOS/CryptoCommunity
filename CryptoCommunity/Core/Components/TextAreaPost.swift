//
//  TextAreaPost.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 10.04.2022.
//

import SwiftUI

struct TextAreaPost: View {
    @Binding var text: String
    let placeholder: String
    
    init (text: Binding<String>, _ placeholder: String) {
        UITextView.appearance().backgroundColor = .clear
        self._text = text
        self.placeholder = placeholder
    }
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            TextEditor(text: $text)
                .padding(4)
        }
        .font(.body)
        
    }
}
