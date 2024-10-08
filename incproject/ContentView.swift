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
                LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .top, endPoint: .bottom)
                VStack {
                    Text("the incoin heist!")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    NavigationLink {
                        FirstView()
                    } label: {
                        Text("Start")
                    }
                    .buttonStyle(.bordered)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
