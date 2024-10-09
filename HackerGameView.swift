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
    let correctCode = "skibidi toilet"

    var body: some View {
        VStack(spacing: 20) {
            Text("The Mysterious Hacker")
                .font(.largeTitle)
                .fontDesign(.monospaced)
                .foregroundColor(.red)
                .bold()
            
            Text("The hacker, code-named toilet was found inside the system numerous times. There was no suspicious activity before. The details of him is highly encrypted using his password. Good luck!")
                .font(.title)
                .fontDesign(.monospaced)
                .padding(10)

            Text("- Agent Z")
                .font(.headline)
                .padding(.bottom, 20)
            
            if hintUnlocked {
                // Show the hint if the correct code was entered
                Text("HINT: The hacker is approximately 6 feet tall.")
                    .font(.headline)
                    .foregroundColor(.green)
                    .transition(.opacity)
            } else {
                // Input field and button to enter the code
                TextField("Enter code to unlock hint", text: $codeInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.numberPad)
                
                Button(action: {
                    if codeInput == correctCode {
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
                        .background(Color.blue)
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

