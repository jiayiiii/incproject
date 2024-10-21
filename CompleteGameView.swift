//
//  CompleteGameView.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 21/10/24.
//
import SwiftUI

struct CompleteGameView: View {
    @State private var isCelebrating = false
    @State private var celebrationOffset: CGFloat = -200 // Start off-screen

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]),
                           startPoint: .top,
                           endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Congratulations!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                    .multilineTextAlignment(.center)

                Text("You have completed the game!")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                    .multilineTextAlignment(.center)

                Text("By: Sharlene Tan Qin Ying, Yip Jia Yi, Tan Xin Tong Joy and Nadra")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top)

                Button(action: {
                    withAnimation {
                        isCelebrating.toggle()
                        if isCelebrating {
                            celebrationOffset = 0
                        } else {
                            celebrationOffset = -200
                        }
                    }
                }) {
                    Text("Celebrate")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 5)
                }
                .padding(.top)
            }
            .padding()

            if isCelebrating {
                ConfettiView()
                    .transition(.opacity)
                    .zIndex(1)
                    .onAppear {
                        celebrationOffset = 0
                    }
            }
        }
        .overlay(
            Text("🎉 Celebration! 🎉")
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
        }
        .animation(.easeInOut(duration: 1), value: particles.count)
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
