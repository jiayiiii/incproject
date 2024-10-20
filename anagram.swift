//
//  anagram.swift
//  incproject
//
//  Created by Nadra binte Muhammad Shahril on 20/10/24.
//

import SwiftUI

struct anagram: View {
    @State private var anagramOne: String = "imino noell" // The scrambled anagram
    @State private var userAnswer: String = ""  // The user's input
    @State private var message: String = ""     // Message to display result
    let correctAnswer: String = "one million"         // The correct answer for the anagram
    @State private var anagramTwo: String = "bereft spermist" // The scrambled anagram
    @State private var userAnswerTwo: String = ""  // The user's input
    @State private var messageTwo: String = ""     // Message to display result
    let correctAnswerTwo: String = "first september"         // The correct answer for the anagram
    
    var body: some View {
        VStack(spacing: 20) {
            Text("What Did He Say?")
                .font(.custom("Menlo", size: 34))
                .bold()
                .foregroundColor(.red)
                .shadow(color: .black, radius: 2, x: 2, y: 2)
                .multilineTextAlignment(.center)
                .padding(.top, 30)
            
            Text("'Stop trying to solve this case..or I will touch u..The imino noell incoins are ours!bereft spermist is a secret! Haha!'")
                .font(.custom("Courier", size: 22))
                .italic()
                .foregroundColor(.black
                )
                .multilineTextAlignment(.center)
                .lineSpacing(5)
                .padding()
            
            VStack {
                Text("Decode what he is trying to say:")
                    .font(.headline)
                    TextField("Enter your first answer", text: $userAnswer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action: {
                                checkAnswer()  // Calling the function
                            }) {
                                Text("Submit")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.red)
                                    .cornerRadius(10)
                            }
                            
                            Text(message) // Display feedback message
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                
                
                TextField("Enter your second answer", text: $userAnswerTwo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            Button(action: {
                            checkAnswerTwo()  // Calling the function
                        }) {
                            Text("Submit")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                        
                        Text(messageTwo) // Display feedback message
                            .font(.subheadline)
                            .foregroundColor(.blue)
                
                
            }
        
        
        
        
    }
    // Function to check the user's answer - must be declared outside the body
    func checkAnswer() {
        if userAnswer.lowercased() == correctAnswer.lowercased() {
            message = "Correct!"
        } else {
            message = "Incorrect. Try again!"
        }
    }
    func checkAnswerTwo() {
        if userAnswerTwo.lowercased() == correctAnswerTwo.lowercased() {
            messageTwo = "Correct!"
        } else {
            messageTwo = "Incorrect. Try again!"
        }
    }

}

#Preview {
  anagram()
}
