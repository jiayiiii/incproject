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
    @State private var progress = 0.0
    @State private var randomPopups: [String] = []
    @State private var showFinalChallenge = false

    let popupMessages = ["Access Denied", "Intruder Detected", "System Compromised", "Attempting Override..."]

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

                    // Randomly appearing pop-up messages
                    ForEach(randomPopups, id: \.self) { message in
                        Text(message)
                            .font(.subheadline)
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

                    // Progress Bar
                    ProgressView(value: progress, total: 1.0)
                        .progressViewStyle(LinearProgressViewStyle(tint: .red))
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .onChange(of: progress, initial: false) { newProgress, _ in
                            if newProgress >= 1.0 {
                                showFinalChallenge = true
                            }
                        }

                    // Final Challenge Buttons
                    if showFinalChallenge {
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
                // Apply the taught animation: repeatForever with autoreverses set to false
                withAnimation(.easeInOut(duration: 0.05).repeatForever(autoreverses: false)) {
                    glitchOffset = 10
                }
                withAnimation(.easeInOut(duration: 0.1).repeatForever(autoreverses: false)) {
                    glitchAmount = 10
                }
                withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                    progress = 1.0
                }
                
                // Timer for random popups
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                    if !showFinalChallenge {
                        randomPopups.append(popupMessages.randomElement()!)
                        if randomPopups.count > 3 {
                            randomPopups.removeFirst()
                        }
                    } else {
                        timer.invalidate()
                    }
                }
            }
        }
    }
}

#Preview {
    PhoneHackedView()
}
