//
//  PageView.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 16.04.2022.
//

import SwiftUI
import Kingfisher

struct PageView: View {
    var body: some View {
        TabView {
            FirtPage()
            SecondPage()
            ThirdPage()
            FinalPage()

        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct FirtPage : View {
    var body: some View {
        VStack {
            Image(systemName: "dollarsign.circle.fill")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundColor(.yellow)
                .shadow(color: .gray, radius: 3)
                .padding()
            Text("Cryptocurrency Charts")
                .font(.system(size: 40))
                .fontWeight(.heavy)
                .multilineTextAlignment(.leading)
                .padding()
            Text("You can check today's currency of all crypto, graphics and market statistics.")
                .font(.system(size: 30))
                .multilineTextAlignment(.leading)
                .padding()
                .foregroundColor(.gray)

        }
    }
}

struct SecondPage : View {
    var body: some View {
        VStack {
            Image(systemName: "text.bubble")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundColor(.blue)
                .shadow(color: .gray, radius: 3)
                .padding()
            Text("Post's")
                .font(.system(size: 40))
                .fontWeight(.heavy)
                .multilineTextAlignment(.leading)
                .padding()
            Text("You can read and write post's about cryptocurrency and share your opinion.")
                .font(.system(size: 30))
                .multilineTextAlignment(.leading)
                .padding(30)
                .foregroundColor(.gray)

        }
    }
}

struct ThirdPage : View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundColor(.blue)
                .shadow(color: .yellow, radius: 3)
                .padding()
            Text("Profile's")
                .font(.system(size: 40))
                .fontWeight(.heavy)
                .multilineTextAlignment(.leading)
                .padding()
            Text("Check user's profile with theirs post's and liked crypto's")
                .font(.system(size: 30))
                .multilineTextAlignment(.leading)
                .padding(30)
                .foregroundColor(.gray)

        }
    }
}

struct FinalPage : View {
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 0) {
                Text("Crypto")
                    .font(.system(size: 38))
                    .fontWeight(.heavy)
                    .foregroundColor(.yellow)
                Text("Community")
                    .font(.system(size: 38))
                    .fontWeight(.heavy)
                    .foregroundColor(.blue)
            }
            
            HStack(spacing: 0) {
                Text("C")
                    .font(.system(size: 100))
                    .fontWeight(.heavy)
                    .foregroundColor(.yellow)
                Text("C")
                    .font(.system(size: 100))
                    .fontWeight(.heavy)
                    .foregroundColor(.blue)
            }
            
            Spacer()
            
            NavigationLink {
                LoginView()
                    .navigationBarHidden(true)
            } label: {
                Text("Let's go")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 100)
                    .background(.blue)
                    .font(.largeTitle)
                    .clipShape(Capsule())
            }
            .padding(.bottom, 80)


        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
            .preferredColorScheme(.light)
    }
}
