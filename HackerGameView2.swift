//
//  HackerGameView2.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 9/10/24.
//


import SwiftUI

struct HackerGameView2: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to Hacker Game 2!")
                    .font(.largeTitle)
                    .padding()
            
                Text("This is where the next part of the game will take place.")
                    .font(.headline)
                    .padding()

                Spacer()

                NavigationLink(destination: HackerGameView()) {
                    Text("Go Back")
                        .fontWeight(.heavy)
                        .padding()
                        .background(Color.mainGreen)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.top, 20)
                }
            }
            .padding()
        }
    }
}

// Preview for HackerGameView2
#Preview {
    HackerGameView2()
}
