//
//  HomeView.swift
//  incproject
//
//  Created by Sharlene Tan Qin Ying on 12/10/24.
//

import SwiftUI

struct HomeView: View {
    @State private var unlockedLevels: [Bool] = [true, false, false, false, false] // Tracks unlocked levels
    @State private var showLockedAlert = false // To show locked message
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Game Levels")
                    .font(.largeTitle)
                    .bold()
                    .padding()

                
                levelButton(level: 1, destination: HackerGameView())
                
                
                levelButton(level: 2, destination: HackerGameView2())
                
                
                levelButton(level: 3, destination: HackerGameView4())
                
                
                levelButton(level: 4, destination: HackerGameView4())
                
                
                levelButton(level: 5, destination: HackerGameView5())

                Spacer()

                
                VStack(spacing: 10) {
                    Text("Game Info & Tips")
                        .font(.headline)
                        .padding(.top)

                    Text("1. Explore all clues carefully.")
                        .font(.subheadline)
                    Text("2. Remember to note down all possible clues")
                        .font(.subheadline)
                    Text("3. This game uses gen Z knowledge.")
                        .font(.subheadline)
                    Text("4. Don't rush! Take your time.")
                        .font(.subheadline)
                    Text("5. Good luck on your heist!")
                        .font(.subheadline)
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $showLockedAlert) {
                Alert(
                    title: Text("Not Unlocked Yet!"),
                    message: nil,
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
    private func levelButton(level: Int, destination: some View) -> some View {
        if unlockedLevels[level - 1] {
            return AnyView(
                NavigationLink(destination: destination) {
                    Text("Level \(level)")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            )
        } else {
            return AnyView(
                Button(action: {
                    showLockedAlert = true
                }) {
                    Text("Level \(level)")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            )
        }
    }
}

#Preview {
    HomeView()
}
