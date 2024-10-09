//
//  FirstView.swift
//  incproject
//
//  Created by jia yi on 8/10/24.
//
import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Your goal is to find out")
                    .fontWeight(.bold)
                    .fontDesign(.serif)
                
                Text("Who was tall Avyan's accomplice?")
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .font(.title2)
                    .fontDesign(.serif)
                HStack {
                    NavigationLink {
                        HackerGameView()
                    } label: {
                        Text("Next")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                            .fontWeight(.heavy)
                    }
                    Image("shadowimage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(15)
                    .padding(.leading, 10)
                }
            }
            .navigationTitle("Minigame 1.1")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    FirstView()
}
