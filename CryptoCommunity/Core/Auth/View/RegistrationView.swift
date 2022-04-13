//
//  RegistrationView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 09.04.2022.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var showImageSelector = false
    
    @Environment(\.presentationMode) var mod
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationLink(destination: ProfilePhotoSelectView(), isActive: $viewModel.userEndRegistration, label: {})
        VStack {
                HeaderView(title1: "Sign up", title2: "Welcome.")
                mainView

        }
        .ignoresSafeArea()
        .background(.gray.opacity(0.1))
        
    }
    
    private var mainView: some View {
        VStack {
            Text("Create a new account")
                .foregroundColor(.black)
                .font(.system(size: 25))
                .fontWeight(.bold)
                .padding(.top, 30)
            TextFieldView(text: $email, placeHolder: "Example@gmail.com", imageName: "person", imageColor: .yellow)
            TextFieldView(text: $password, placeHolder: "*************", imageName: "lock", imageColor: .blue)
            TextFieldView(text: $username, placeHolder: "examplesuser", imageName: "person.text.rectangle", imageColor: .red)
            HStack {
                Spacer()
                Button {
                    viewModel.registerUser(email: email, password: password, username: username)
                } label: {
                    Text("Sign up")
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

            Button {
                mod.wrappedValue.dismiss()
            } label: {
                Text("Already have an account? Sign in now")
                    .font(.caption)
                    .foregroundColor(.blue)
                    .padding(.bottom, 30)
            }

        }

    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .previewDevice("iPhone 13")
    }
}
