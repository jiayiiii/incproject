//
//  HackerGameView.swift
//  incproject
//
//  Created by Sharlene Tan Qin Ying on 9/10/24.
//

import SwiftUI

struct HackerGameView: View {
    // State variables to track user input and whether the hint is unlocked
    @State private var codeInput = ""
    @State private var hintUnlocked = false
    @State private var incorrectCode = false
    
    // The correct code to unlock the hint
    let correctCode = "john pork"

    var body: some View {
        VStack(spacing: 20) {
            Text("The Mysterious Hacker")
                .font(.largeTitle)
                .fontDesign(.monospaced)
                .foregroundColor(.mainGreen)
                .bold()
                .multilineTextAlignment(.center)
            
            Text("Tall Avyan's accomplice was a hybrid of human and something else, standing at around 8 feet (both vertically and horizontally). His favourite color is pink.")
                .font(.title)
                .padding(10)
                .multilineTextAlignment(.center)

            Text("- Agent Johnpross")
                .font(.headline)
                .padding(.bottom, 20)
            
            if hintUnlocked {
                // Show the hint if the correct code was entered
                Text("Correct! His accomplice was John Pork. HINT: The heist took place in a city well known for its attraction Victoria Falls.") //zimbabwe
                    .font(.headline)
                    .foregroundColor(.green)
                    .transition(.opacity)
                    .multilineTextAlignment(.center)
            } else {
                // Input field and button to enter the code
                TextField("Enter code to unlock hint", text: $codeInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.numberPad)
                
                Button(action: {
                    if codeInput.lowercased() == correctCode {
                        withAnimation {
                            hintUnlocked = true
                            incorrectCode = false
                        }
                    } else {
                        incorrectCode = true
                    }
                }) {
                    Text("Submit Code")
                        .padding()
                        .background(Color.mainGreen)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                if incorrectCode {
                    // Display error message if the code is incorrect
                    Text("Incorrect code. Try again.")
                        .foregroundColor(.red)
                        .transition(.opacity)
                }
            }
        }
        .padding()
    }
}

#Preview {
    HackerGameView()
}

