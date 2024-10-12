//
//  ContentView.swift
//  incproject
//
//  Created by youngliz lover on 9/9/24.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("wallpaper")
                .resizable()
                .scaledToFill()
                .scaledToFit()
                .frame(width: 1400)
                .edgesIgnoringSafeArea(.all)
                LinearGradient(gradient: Gradient(colors: [.white, .mainGreen]), startPoint: .top, endPoint: .bottom)
                    .opacity(0.2)
                
                VStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 300, height: 200)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .overlay(
                            VStack {
                                Text("The Incoin Heist!")
                                    .bold()
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                                    .padding()

                                NavigationLink {
                                    FirstView()
                                } label: {
                                    Text("Start")
                                        .fontWeight(.heavy)
                                        .padding()
                                        .background(Color.mainGreen)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                            }
                        )
                }
                .padding()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
