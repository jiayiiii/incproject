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
                LinearGradient(gradient: Gradient(colors: [.white, .mainGreen]), startPoint: .top, endPoint: .bottom)
                VStack {
                    Text("The Incoin Heist!")
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
