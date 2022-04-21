//
//  ResetPasswordView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 18.04.2022.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State var email: String = ""
    
    var body: some View {
        VStack {
        HeaderView(title1: "Reset", title2: "Forgot password?")
        TextFieldView(text: $email, placeHolder: "Example@gmail.com", imageName: "person", imageColor: .yellow, secureField: false)
                .padding(.top, 200)
            Button {
                viewModel.resetPassword(email: email)
            } label: {
                Text("Send")
                    .font(.body)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            .frame(width: 150, height: 50)
            .background(.blue)
            .clipShape(Capsule())
            .padding()
            Spacer()
        }
        .ignoresSafeArea()
        .background(.gray.opacity(0.1))
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
