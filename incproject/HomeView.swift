//
//  HomeView.swift
//  incproject
//
//  Created by Sharlene Tan Qin Ying on 12/10/24.
//

import SwiftUI

struct HomeView: View {
    @State private var unlockedLevels: [Bool] = [true, false, false] // Tracks unlocked levels
    @State private var showLockedAlert = false // To show locked message
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Game Levels")
                    .font(.largeTitle)
                    .bold()
                    .padding()

                // Level 1 Button
                if unlockedLevels[0] {
                    NavigationLink(destination: HackerGameView()) {
                        Text("Level 1")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                } else {
                    Button(action: {
                        showLockedAlert = true
                    }) {
                        Text("Level 1")
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }

                // Level 2 Button
                if unlockedLevels[1] {
                    NavigationLink(destination: HackerGameView2()) {
                        Text("Level 2")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                } else {
                    Button(action: {
                        showLockedAlert = true
                    }) {
                        Text("Level 2")
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }

                Spacer()
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
}

#Preview {
    HomeView()
}

