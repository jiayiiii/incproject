//
//  phonehackedView.swift
//  incproject
//
//  Created by Sharlene Tan Qin Ying on 21/10/24.
//

import SwiftUI

struct PhoneHackedView: View {
    @State private var isAnimating = false
    @State private var showAlert = false // State variable for the alert

    var body: some View {
        NavigationStack { // Wrap in NavigationStack for navigation to work
            ZStack {
                // Background with a dark gradient
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.red.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Text("WARNING: HACK DETECTED!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .shadow(color: .black, radius: 10, x: 0, y: 0)
                    
                    Text("Your device has been compromised by Tall Avyan.")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    Text("He's challenging you to a game!")
                        .font(.title)
                        .foregroundColor(.yellow)
                        .padding()
                        .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isAnimating)
                        .opacity(isAnimating ? 1 : 0.7)

                    // Animated Hack Progress Bar
                    ProgressView(value: 0.8, total: 1.0)
                        .progressViewStyle(LinearProgressViewStyle(tint: .red))
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(10)
                        .shadow(radius: 5)

                    Spacer()

                    NavigationLink(destination: BattleGameView()) {
                        Text("Accept Challenge")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    }
                    .buttonStyle(PlainButtonStyle()) // Ensures the link looks like a button

                    Button(action: {
                        showAlert = true // Show the alert when button is tapped
                    }) {
                        Text("Report Hack")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Oh No!!!"), message: Text("You have to hack through the phone to win!!!"), dismissButton: .default(Text("OK")))
                    }
                    
                }
                .onAppear {
                    isAnimating = true
                }
            }
        }
    }
}

#Preview {
    PhoneHackedView()
}
