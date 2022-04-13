//
//  ProfilePhotoSelectView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 09.04.2022.
//

import SwiftUI

struct ProfilePhotoSelectView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            
        HeaderView(title1: "Sign up", title2: "Add your photo.")
            
            Group {
                if let image = selectedImage {
                    Button {
                        showImagePicker.toggle()
                    } label: {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 200, height: 200)
                            .scaledToFill()
                            .cornerRadius(30)
                            .foregroundColor(.blue)

                    }
                    .padding(.vertical, 50)
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(image: $selectedImage)
                    }
                    
                    Button {
                        guard let selectedImage = selectedImage else {
                            return
                        }
                        viewModel.uploadImageData(image: selectedImage)
                    } label: {
                        Text("Continue")
                            .font(.body)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .frame(width: 300, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()

                } else {
                    Button {
                        showImagePicker.toggle()
                    } label: {
                        Image(systemName: "plus.viewfinder")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .scaledToFill()
                            .cornerRadius(30)
                            .foregroundColor(.blue)

                    }
                    .padding(.vertical, 50)
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(image: $selectedImage)
                    }

                }
            }
            Spacer()


        }
        .ignoresSafeArea()
    }
}

struct ProfilePhotoSelectView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectView()
            .previewDevice("iPhone 13")
    }
}
