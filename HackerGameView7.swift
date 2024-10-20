//
//  HackerGameView7.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 20/10/24.
//
import SwiftUI

struct HackerGameView7: View {
    var body: some View {
        VStack {
            Text("Welcome to Hacker Game View 7")
                .font(.largeTitle)
                .padding()

            Text("This is where the next part of the game takes place.")
                .font(.title)
                .padding()

            
            Button(action: {
                
            }) {
                Text("Continue")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Hacker Game 7") 
    }
}

#Preview {
    HackerGameView7()
}

