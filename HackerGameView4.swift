//
//  HackerGameView4.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 20/10/24.
//


import SwiftUI

struct HackerGameView4: View {
    var body: some View {
        ZStack {
            Image("freakbob")
                .resizable()
                .scaledToFill()
                .frame(width: 500, height: 900)
                .clipped()
            
            NavigationLink(destination: Anagram()) {
                HStack {
                    Image(systemName: "phone.fill")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text("Answer")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                }
                .padding()
                .padding(.horizontal, 30)
                .background(Color.green)
                .cornerRadius(10)
                .padding(.bottom, 30)
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

#Preview {
    HackerGameView4()
}
