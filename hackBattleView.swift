//
//  hackBattleView.swift
//  incproject
//
//  Created by Sharlene Tan Qin Ying on 21/10/24.
//

import SwiftUI

struct HackBattleView: View {
    @State private var playerScore = 0
    @State private var avyanScore = 0
    @State private var showHints = false
    @State private var showRules = false
    @State private var hints: [String] = [
        "Stay calm and think logically.",
        "Use patterns to crack the code.",
        "Don't rush; take your time!",
        "Look for clues in the environment."
    ]
    @State private var selectedHint: String?
    @State private var gameEnded = false // Track if the game has ended
    @State private var gameResult: String? // Track the game result

    var body: some View {
        NavigationStack {
            ZStack {
                // Background with a dark gradient
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    Text("HACK BATTLE: TALL AVYAN vs. YOU!")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding()
                        .shadow(color: .black, radius: 10, x: 0, y: 0)

                    HStack {
                        VStack {
                            Text("Your Score")
                                .font(.headline)
                                .foregroundColor(.green)
                            Text("\(playerScore)")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }

                        Spacer()

                        VStack {
                            Text("Tall Avyan's Score")
                                .font(.headline)
                                .foregroundColor(.red)
                            Text("\(avyanScore)")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()

                    Button(action: {
                        // Simulate a hack attempt
                        let success = Bool.random()
                        if success {
                            playerScore += 1
                        } else {
                            avyanScore += 1
                        }
                        
                        // Check for game over
                        checkGameOver()
                    }) {
                        Text("Attempt to Hack!")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    }
                    .padding()

                    Button(action: {
                        showHints.toggle()
                    }) {
                        Text("Get a Hint")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    }

                    if showHints {
                        ForEach(hints.indices, id: \.self) { index in
                            Button(action: {
                                selectedHint = hints[index]
                            }) {
                                Text("Hint \(index + 1)")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .background(Color.gray.opacity(0.8))
                                    .cornerRadius(5)
                            }
                        }
                    }

                    if let hint = selectedHint {
                        Text(hint)
                            .font(.subheadline)
                            .foregroundColor(.yellow)
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(10)
                            .padding(.top, 10)
                    }

                    Button(action: {
                        showRules.toggle()
                    }) {
                        Text("Show Rules")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    }

                    if showRules {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Game Rules:")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.top)
                            Text("1. Each player takes turns attempting to hack.")
                                .foregroundColor(.white)
                            Text("2. A successful hack increases your score.")
                                .foregroundColor(.white)
                            Text("3. The player with the highest score at the end wins!")
                                .foregroundColor(.white)
                            Text("4. Use hints wisely to gain an advantage.")
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.top, 10)
                    }

                    Spacer()

                    // Show button to go to CompleteGameView only if the player won
                    if gameEnded && (playerScore >= 5) {
                        NavigationLink(destination: CompleteGameView()) {
                            Text("Go to Results")
                                .font(.headline)
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                }
                .padding()
            }
        }
    }

    private func checkGameOver() {
        // Determine if the game has ended based on the scores
        if playerScore >= 5 { // Set win condition
            gameResult = "You won! 🎉"
            gameEnded = true
        } else if avyanScore >= 5 { // Set lose condition
            gameResult = "You lost! Try again."
            resetGame() // Restart the game
        }
    }

    private func resetGame() {
        playerScore = 0
        avyanScore = 0
    }
}

#Preview {
    HackBattleView()
}
