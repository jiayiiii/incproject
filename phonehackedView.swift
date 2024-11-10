//
//  phonehackedView.swift
//  incproject
//
//  Created by Sharlene Tan Qin Ying on 21/10/24.
//
import SwiftUI

struct PhoneHackedView: View {
    @State private var glitchOffset: CGFloat = 0.0
    @State private var glitchAmount: CGFloat = 1.0
    @State private var hackedPercentage = 0
    @State private var randomPopups: [String] = []
    @State private var showFinalChallenge = false
    @State private var typedMessage = "" // Holds the typed message so far
    @State private var messageToType = "I have access to EVERYTHING on your phone. I challenge you to a battle."
    @State private var showButtons = false // Control when to show buttons

    let popupMessages = [
        "Access Denied", "Intruder Detected", "System Compromised", "Attempting Override...", "Error 404",
        "Critical System Failure", "Reboot Required", "Bypassing Security", "Data Corruption", "Hacker Detected"
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                // Background with animated glitch effect
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.red.opacity(0.8), Color.black]),
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    .offset(x: glitchOffset)
                    .animation(.easeInOut(duration: 0.05).repeatForever(autoreverses: false), value: glitchOffset)

                VStack(spacing: 20) {
                    // Glitchy Warning Text
                    Text("WARNING: HACK DETECTED!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .overlay(
                            Text("WARNING: HACK DETECTED!")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.red.opacity(0.8))
                                .offset(x: glitchAmount, y: -glitchAmount)
                        )
                        .overlay(
                            Text("WARNING: HACK DETECTED!")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.blue.opacity(0.7))
                                .offset(x: -glitchAmount, y: glitchAmount)
                        )
                        .animation(.easeInOut(duration: 0.1).repeatForever(autoreverses: false), value: glitchAmount)

                    // Hacked Percentage with increased size
                    Text("\(hackedPercentage)%")
                        .font(.system(size: 80, weight: .bold))
                        .foregroundColor(.red)
                        .padding()
                        .frame(height: UIScreen.main.bounds.height * 0.2) // Takes about 1/5 of the screen height
                        .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: false), value: hackedPercentage)

                    // Typing Effect Text (appears after hack hits 100%)
                    if hackedPercentage == 100 {
                        Text(typedMessage)
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(.yellow)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .multilineTextAlignment(.center)
                            .animation(.easeIn(duration: 0.05), value: typedMessage)
                    }

                    // Randomly appearing pop-up messages with varied sizes and positions
                    if hackedPercentage < 100 {
                        ForEach(randomPopups, id: \.self) { message in
                            Text(message)
                                .font(.system(size: CGFloat.random(in: 16...36), weight: .bold)) // Random font size
                                .foregroundColor(.white)
                                .padding(5)
                                .background(Color.red.opacity(0.8))
                                .cornerRadius(5)
                                .position(
                                    x: CGFloat.random(in: 50...300),
                                    y: CGFloat.random(in: 100...600)
                                )
                                .transition(.scale)
                        }
                    }

                    Spacer()

                    // Final Challenge Buttons (appears after typing finishes)
                    if showButtons {
                        VStack {
                            NavigationLink(destination: BattleGameView()) {
                                Text("Accept Challenge")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Color.red)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                            }
                            .buttonStyle(PlainButtonStyle())

                            NavigationLink(destination: HackBattleView()) {
                                Text("Report Hack")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black.opacity(0.7))
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }
                        }
                        .transition(.scale.combined(with: .opacity))
                    }
                }
                .padding()
            }
            .onAppear {
                // Apply animations for glitch effects
                withAnimation(.easeInOut(duration: 0.05).repeatForever(autoreverses: false)) {
                    glitchOffset = 10
                }
                withAnimation(.easeInOut(duration: 0.1).repeatForever(autoreverses: false)) {
                    glitchAmount = 10
                }

                // Timer for updating hacked percentage (slower)
                Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
                    if hackedPercentage < 100 {
                        hackedPercentage += Int.random(in: 1...2) // Smaller increment for slower increase
                        if hackedPercentage > 100 {
                            hackedPercentage = 100
                        }
                    } else {
                        // Start typing message when hack reaches 100%
                        startTypingMessage()
                        timer.invalidate()
                    }
                }

                // Timer for random popups (faster, more frequent)
                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in // Faster popup frequency
                    if hackedPercentage < 100 {
                        randomPopups.append(popupMessages.randomElement()!)
                        if randomPopups.count > 6 { // Show more popups
                            randomPopups.removeFirst()
                        }
                    } else {
                        timer.invalidate()
                    }
                }
            }
        }
    }

    // Function to start typing the message once hack reaches 100%
    private func startTypingMessage() {
        var characterIndex = 0
        let messageCount = messageToType.count
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if characterIndex < messageCount {
                typedMessage.append(messageToType[messageToType.index(messageToType.startIndex, offsetBy: characterIndex)])
                characterIndex += 1
            } else {
                // Once the message is typed, show the buttons
                showButtons = true
                timer.invalidate()
            }
        }
    }
}

#Preview {
    PhoneHackedView()
}
