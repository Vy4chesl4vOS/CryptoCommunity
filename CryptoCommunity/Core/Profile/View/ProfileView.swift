//
//  ProfileView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 10.04.2022.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var likedChoose = true
    @ObservedObject var viewModel: ProfileViewModel
    @Environment(\.presentationMode) var mod
    
    let user: User
    
    init (user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        VStack {
           headerView
            VStack {
                HStack(spacing: 20) {
                    Button {
                            self.likedChoose = true
                    } label: {
                        Text("Liked")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(width: 150)
                            .padding(.vertical, 10)
                            .background(likedChoose ? .blue : .gray)
                            .clipShape(Capsule())
                    }
                    Button {
                            self.likedChoose = false
                        
                    } label: {
                        Text("Posts")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(width: 150)
                            .padding(.vertical, 10)
                            .background(likedChoose ? .gray : .blue)
                            .clipShape(Capsule())
                    }

                }
                .padding([.bottom, .horizontal])
                
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
            }
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.userPosts) { post in
                        NavigationLink {
                            PostDetailView(post: post)
                        } label: {
                            PostRowView(post: post)
                        }

                    }
                }
            }
            
            Spacer()
        }
        .ignoresSafeArea()
        .background(.gray.opacity(0.2))
    }
    
    private var headerView : some View {
            
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addCurve(to: CGPoint(x: UIScreen.main
                    .bounds.width, y: 0), control1: CGPoint(x: UIScreen.main.bounds.width / 20, y: 350), control2: CGPoint(x: (UIScreen.main
                        .bounds.width * 19) / 20, y: 350))
            }
            .foregroundColor(.blue)
            .frame(height: 350)
                
                VStack {
                        Text("PROFILE")
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .font(.largeTitle)
                            .padding(.top, 50)
                    
                    KFImage(URL(string: user.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                         .frame(width: 150, height: 150)
                         .shadow(color: .gray, radius: 10)
                    Text("@\(user.username)")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
        }

    }
}

