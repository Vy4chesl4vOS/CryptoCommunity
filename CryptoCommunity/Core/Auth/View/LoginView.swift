//
//  AuthView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 09.04.2022.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    init () {
        UserDefaults.standard.set(true, forKey: "page")
    }
    
    var body: some View {
            VStack {
                        HeaderView(title1: "CryptoCom", title2: "Welcome.")
                        mainView

                }
                .ignoresSafeArea()
            .background(.gray.opacity(0.1))
    }
    
    private var mainView: some View {
        VStack {
            Text("Login")
                .foregroundColor(.black)
                .font(.system(size: 37))
                .fontWeight(.bold)
                .padding(.top, 30)
            TextFieldView(text: $email, placeHolder: "Example@gmail.com", imageName: "person", imageColor: .yellow, secureField: false)
            TextFieldView(text: $password, placeHolder: "Password", imageName: "lock", imageColor: .blue, secureField: true)
            HStack {
                Button {
                    //
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                }
                Spacer()
                Button {
                    viewModel.loginUser(email: email, password: password)
                } label: {
                    Text("Sign in")
                        .font(.body)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                .frame(width: 150, height: 50)
                .background(.blue)
                .clipShape(Capsule())

            }
            .padding(.horizontal, 30)
            .padding(.vertical)
            Spacer()

            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                Text("Haven't account? Sign up now")
                    .font(.caption)
                    .foregroundColor(.blue)
                    .padding(.bottom, 30)
            }

        }

    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice("iPhone 13")
    }
}
