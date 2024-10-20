//
//  HackerGameView6.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 20/10/24.
//


import SwiftUI

struct HackerGameView6: View {
    var body: some View {
        ZStack {
            Image("airport image")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipped()
            Text("Buy an aeroplane ticket?")
                .font(.largeTitle)
                .padding()
        }
    }
}

#Preview {
    HackerGameView6()
}
