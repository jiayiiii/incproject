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
    @State private var typedMessage = ""
    @State private var messageToType = "I have access to EVERYTHING on your phone. I challenge you to a battle."
    @State private var showButtons = false
    @State private var accentColor: Color = .white // Changing accent color for chaos

    let popupMessages = [
        "Access Denied", "Intruder Detected", "System Compromised", "Attempting Override...", "Error 404",
        "Critical System Failure", "Reboot Required", "Bypassing Security", "Data Corruption", "Hacker Detected"
    ]
    
    let chaoticColors: [Color] = [.yellow, .cyan, .pink, .purple, .blue, .orange] // Add chaotic colors

    var body: some View {
        NavigationStack {
            ZStack {
                // Constant red and black background
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.red.opacity(0.8), Color.black]),
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    .offset(x: glitchOffset)
                    .animation(.easeInOut(duration: 0.05).repeatForever(autoreverses: false), value: glitchOffset)

                VStack(spacing: 20) {
                    // Glitchy, chaotic Warning Text with random color shifts
                    Text("WARNING: HACK DETECTED!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(accentColor) // Using random accent color
                        .padding()
                        .overlay(
                            Text("WARNING: HACK DETECTED!")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(accentColor.opacity(0.8))
                                .offset(x: glitchAmount, y: -glitchAmount)
                        )
                        .overlay(
                            Text("WARNING: HACK DETECTED!")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(accentColor.opacity(0.5))
                                .offset(x: -glitchAmount, y: glitchAmount)
                        )
                        .animation(.easeInOut(duration: 0.1).repeatForever(autoreverses: true), value: glitchAmount)

                    // Hacked Percentage, fluctuating chaotically
                    Text("\(hackedPercentage)%")
                        .font(.system(size: 80, weight: .bold))
                        .foregroundColor(.red)
                        .padding()
                        .frame(height: UIScreen.main.bounds.height * 0.2)
                        .rotationEffect(.degrees(Double.random(in: -10...10)))
                        .animation(.easeInOut(duration: 0.3).repeatForever(autoreverses: true), value: hackedPercentage)

                    // Typing Effect Text (appears after hack hits 100%)
                    if hackedPercentage == 100 {
                        Text(typedMessage)
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(accentColor)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .multilineTextAlignment(.center)
                            .animation(.easeIn(duration: 0.05), value: typedMessage)
                    }

                    // Pop-up messages flying around chaotically
                    if hackedPercentage < 100 {
                        ForEach(randomPopups, id: \.self) { message in
                            Text(message)
                                .font(.system(size: CGFloat.random(in: 16...36), weight: .bold))
                                .foregroundColor(accentColor)
                                .padding(5)
                                .background(Color.red.opacity(0.8))
                                .cornerRadius(5)
                                .rotationEffect(.degrees(Double.random(in: -30...30)))
                                .position(
                                    x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                                    y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                                )
                                .transition(.scale)
                        }
                    }

                    Spacer()

                    // Final Challenge Buttons
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

                // Timer for hacked percentage
                Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { timer in
                    if hackedPercentage < 100 {
                        hackedPercentage += Int.random(in: 1...5)
                        if hackedPercentage > 100 {
                            hackedPercentage = 100
                        }
                    } else {
                        startTypingMessage()
                        timer.invalidate()
                    }
                }

                // Timer for popups
                Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
                    if hackedPercentage < 100 {
                        randomPopups.append(popupMessages.randomElement()!)
                        if randomPopups.count > 10 {
                            randomPopups.removeFirst()
                        }
                    } else {
                        timer.invalidate()
                    }
                }

                // Timer for chaotic color changes
                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                    withAnimation {
                        accentColor = chaoticColors.randomElement()!
                    }
                }
            }
        }
    }

    private func startTypingMessage() {
        var characterIndex = 0
        let messageCount = messageToType.count
        Timer.scheduledTimer(withTimeInterval: 0.07, repeats: true) { timer in
            if characterIndex < messageCount {
                typedMessage.append(messageToType[messageToType.index(messageToType.startIndex, offsetBy: characterIndex)])
                characterIndex += 1
            } else {
                showButtons = true
                timer.invalidate()
            }
        }
    }
}

#Preview {
    PhoneHackedView()
}
