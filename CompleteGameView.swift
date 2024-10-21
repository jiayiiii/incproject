//
//  CompleteGameView.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 21/10/24.
//
import SwiftUI

struct CompleteGameView: View {
    @State private var isCelebrating = false

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Congratulations!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                Text("You have completed the game!")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                Button("Celebrate") {
                    isCelebrating.toggle()
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()

            if isCelebrating {
                ConfettiView()
                    .transition(.opacity)
                    .zIndex(1)
            }
        }
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
