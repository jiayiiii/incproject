//
//  HomeView.swift
//  incproject
//
//  Created by Sharlene Tan Qin Ying on 12/10/24.
//

import SwiftUI

struct HomeView: View {
    @State private var unlockedLevels: [Bool] = Array(repeating: true, count: 9)
    @State private var selectedLevel: Int?
    @State private var showDescription = false

    private let levelDescriptions: [Int: String] = [
        1: "Level 1: Who is Tall Avyan's accomplice?",
        2: "Level 2: Where did the heist occur?",
        3: "Level 3: BRINNGGG... someone's calling",
        4: "Level 4: Anagram puzzles to reveal the hidden truth.",
        5: "Level 5: Navigate through the dangerous alley.",
        6: "Level 6: Wheel of fortune challenge awaits!",
        7: "Level 7: Beat the clock in a high-stakes heist.",
        8: "Level 8: Your phone got hacked",
        9: "Level 9: The last battle..."
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                // Background Gradient
                LinearGradient(gradient: Gradient(colors: [.black, .gray]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Text("Game Levels")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.red)
                        .padding()

                    ForEach(1...9, id: \.self) { level in
                        levelButton(level: level)
                    }

                    Spacer()
                }
                .padding()
                .overlay(
                    Group {
                        if showDescription, let level = selectedLevel {
                            VStack {
                                Text(levelDescriptions[level, default: "No description available."])
                                    .font(.headline)
                                    .padding()
                                    .background(Color.black.opacity(0.9))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding()
                                    .transition(.scale) // Add scaling transition
                                    .animation(.easeInOut, value: showDescription) // Animate the change

                                Button("Close") {
                                    showDescription = false
                                }
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.black.opacity(0.7))
                            .edgesIgnoringSafeArea(.all)
                        }
                    }
                )
            }
        }
    }

    private func levelButton(level: Int) -> some View {
        HStack {
            Button(action: {
                if unlockedLevels[level - 1] {
                    // Navigate to the level view (not implemented here)
                }
            }) {
                Text("Level \(level)")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .scaleEffect(1.05) // Slightly scale up on press
                    .animation(.easeInOut, value: level) // Animate scale change
            }

            Button(action: {
                selectedLevel = level
                showDescription.toggle() // Show the description when the info button is clicked
            }) {
                Image(systemName: "info.circle")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(5)
                    .shadow(radius: 5)
            }
        }
    }
}

#Preview {
    HomeView()
}
