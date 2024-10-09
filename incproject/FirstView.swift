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
            VStack(spacing: 30) {
                // Introductory text with emphasis on urgency
                Text("You have been **selected** to lead a high-stakes investigation.")
                    .font(.title3)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                    .padding(.horizontal)
                
                Text("A **robbery** has occurred at Inc HQ, and time is running out.")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .italic()
                    .multilineTextAlignment(.center)
                
                Text("You are **Inc's last hope.**")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.mainGreen)
                    .multilineTextAlignment(.center)
                    .transition(.opacity)
                
                Divider()
                    .frame(height: 2)
                    .background(Color.black)
                    .padding(.vertical)

                // Mission text with increased drama
                VStack {
                    Text("Mission 1:")
                        .font(.title)
                        .fontWeight(.bold)
                        .fontDesign(.serif)
                        .foregroundColor(.black)
                        .underline()

                    Text("Find out...")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                    
                    Text("Who was tall Avyan's accomplice?")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.mainGreen)
                        .fontDesign(.monospaced)
                        .padding(.top, 10)
                        .transition(.scale)
                        .multilineTextAlignment(.center)
                }
                
                // Next button and image for visual impact
                HStack {
                    NavigationLink {
                        HackerGameView()
                    } label: {
                        Text("Next")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.mainGreen)
                            .cornerRadius(10)
                            .font(.title3)
                            .fontWeight(.heavy)
                            .shadow(radius: 5)
                    }
                    
                    Image("shadowimage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .cornerRadius(15)
                        .padding(.leading, 10)
                        .shadow(radius: 10)
                }
            }
            .padding(.horizontal, 20)
            .transition(.opacity)

            .navigationTitle("Minigame 1")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    FirstView()
}
