//
//  CompleteGameView.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 21/10/24.
//
import SwiftUI

struct CompleteGameView: View {
    @State private var isCelebrating = false
    @State private var celebrationOffset: CGFloat = -200
    @State private var isAnimatingText = false
    @State private var confettiSpeed = 0.5

    var body: some View {
        ZStack {
            // Background with a vibrant gradient
            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

            VStack {
                // Title
                Text("🎉 YOU DID IT! 🎉")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.yellow)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                    .multilineTextAlignment(.center)
                    .scaleEffect(isAnimatingText ? 1.2 : 1.0)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isAnimatingText)
                    .onAppear {
                        isAnimatingText = true
                    }

                // Subtitle message
                Text("You have retrieved the Incoins! 💰💎")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                    .multilineTextAlignment(.center)

                // Creator Info
                Text("By: Sharlene Tan Qin Ying, Yip Jia Yi, Tan Xin Tong Joy and Nadra")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top)

                // Celebrate button
                Button(action: {
                    withAnimation {
                        isCelebrating.toggle()
                        if isCelebrating {
                            celebrationOffset = 0
                            confettiSpeed = 1.0  // Speed up confetti effect for more excitement
                        } else {
                            celebrationOffset = -200
                            confettiSpeed = 0.5  // Slow down after celebration ends
                        }
                    }
                }) {
                    Text("YAYYAYAY! Let's Celebrate 🎉")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 5)
                        .font(.headline)
                }
                .padding(.top)
            }
            .padding()

            // Confetti effect
            if isCelebrating {
                ConfettiView(speed: confettiSpeed)
                    .transition(.opacity)
                    .zIndex(1)
                    .onAppear {
                        celebrationOffset = 0
                    }
            }
        }
        .overlay(
            Text("🎉 YAY YOU WON! 🎉")
                .font(.largeTitle)
                .foregroundColor(.yellow)
                .padding()
                .background(Color.black.opacity(0.7))
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                .offset(y: celebrationOffset)
                .animation(.easeOut(duration: 0.5), value: celebrationOffset)
                .opacity(isCelebrating ? 1 : 0)
        )
    }
}

struct ConfettiView: View {
    @State private var particles: [Particle] = []
    private let particleCount = 100
    var speed: Double // Dynamically change speed of confetti

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(particles) { particle in
                    Circle()
                        .fill(particle.color)
                        .frame(width: particle.size, height: particle.size)
                        .position(particle.position)
                        .transition(.opacity)
                }
            }
            .onAppear {
                createParticles(in: geometry.size)
            }
            .animation(.easeInOut(duration: speed), value: particles.count)
        }
    }

    private func createParticles(in size: CGSize) {
        particles = (0..<particleCount).map { _ in
            Particle(
                position: CGPoint(x: CGFloat.random(in: 0...size.width), y: CGFloat.random(in: 0...size.height)),
                color: randomColor(),
                size: CGFloat.random(in: 5...10)
            )
        }
    }

    private func randomColor() -> Color {
        return Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}

struct Particle: Identifiable {
    let id = UUID()
    var position: CGPoint
    var color: Color
    var size: CGFloat
}

struct CompleteGameView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteGameView()
    }
}
