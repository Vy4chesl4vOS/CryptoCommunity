//
//  MainTabView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 09.04.2022.
//

import SwiftUI

struct MainTabView: View {
    @State private var currentTab = "chart.bar.xaxis"
    @State private var showLogout = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    init () {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                AllCurrencyView()
                    .tag("chart.bar.xaxis")
                AllPostsView()
                    .tag("newspaper")
                AllUsersView()
                    .tag("person")
                Text("Logout")
                    .tag("rectangle.portrait.and.arrow.right")
            }
            
            HStack(spacing: 40) {
                TabButton(image: "chart.bar.xaxis")
                TabButton(image: "newspaper")
                NavigationLink {
                    NewPostView()
                        .navigationBarHidden(true)
                } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .padding(20)
                            .background(Circle().fill(.yellow))
                            .shadow(color: .gray.opacity(0.4), radius: 5)
                            .offset(y: -20)
                            .padding(.horizontal, -15)
                }

                
                TabButton(image: "person")
                Button {
                    showLogout.toggle()
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.gray)
                }
                .actionSheet(isPresented: $showLogout) {
                    .init(title: Text("Sign Out"), message: Text("Do you want to change account?"), buttons: [.cancel(), .default(Text("Logout"), action: {
                        viewModel.signOut()
                    })])
                }
            }
            .frame(maxWidth: .infinity)
            .background(.gray.opacity(0.1))
            

        }
    }
    
    
    @ViewBuilder
    func TabButton(image: String) -> some View {
        Button {
            withAnimation {
                currentTab = image
            }
        } label: {
            Image(systemName: image)
                .resizable()
                .scaledToFill()
                .frame(width: 25, height: 25)
                .foregroundColor(currentTab == image ? .blue : .gray.opacity(0.8))
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .previewDevice("iPhone 13")
    }
}
