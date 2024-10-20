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
            Text("You have arrived in Tennessee")
                .font(.largeTitle)
                .padding()
            
            Image("Ten")
                .resizable()
                .scaledToFit()
                .frame(width: 800, height: 400)
                .clipped()
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
