//
//  FirstView.swift
//  incproject
//
//  Created by jia yi on 8/10/24.
//
import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.black, Color.gray.opacity(0.8)]),
                    startPoint: .top, endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)

                VStack(spacing: 40) {
                    Text("YOU HAVE BEEN SELECTED")
                        .font(.system(size: 34, weight: .bold, design: .monospaced))
                        .foregroundColor(.red)
                        .shadow(color: .black, radius: 5, x: 3, y: 3)
                        .multilineTextAlignment(.center)
                        .padding(.top, 40)
                    
                    Text("A high-stakes investigation has begun.\nA **robbery** at Inc HQ. Time is **running out.**")
                        .font(.system(size: 20, weight: .medium, design: .serif))
                        .foregroundColor(.white)
                        .italic()
                        .lineSpacing(6)
                        .padding(.horizontal, 20)

                    Text("You are INC's **last hope.**")
                        .font(.system(size: 28, weight: .heavy, design: .serif))
                        .foregroundColor(.mainGreen)
                        .multilineTextAlignment(.center)
                        .transition(.opacity)

                    Divider()
                        .frame(height: 1.5)
                        .background(Color.red.opacity(0.8))
                        .shadow(color: .black, radius: 2, x: 1, y: 1)
                        .padding(.vertical, 10)

                    VStack(spacing: 10) {
                        Text("Mission 1:")
                            .font(.system(size: 28, weight: .bold, design: .serif))
                            .foregroundColor(.white)
                            .underline()
                            .shadow(color: .black, radius: 4)

                        Text("Find out...")
                            .font(.system(size: 22, weight: .semibold, design: .serif))
                            .foregroundColor(.gray)
                            .italic()

                        Text("Who was Tall Avyan's accomplice?")
                            .font(.system(size: 18, weight: .bold, design: .monospaced))
                            .foregroundColor(.black)
                            .padding(.top, 10)
                            .scaledToFit()
                    }

                    HStack(spacing: 15) {
                        NavigationLink {
                            HackerGameView(onComplete: {
                                // Add any completion logic here if needed
                            })
                        } label: {
                            Text("Next")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.red.opacity(0.8))
                                .cornerRadius(10)
                                .shadow(color: .black, radius: 5, x: 2, y: 2)
                        }
                        
                        Image("shadowimage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 8)
                    }
                }
                .padding(.horizontal, 20)
                .navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    FirstView()
}
