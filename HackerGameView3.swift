//
//  HackerGameView3.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 20/10/24.
//
import SwiftUI

struct HackerGameView4: View {
    @State private var userAnswer: String = "" // User input for the answer
    @State private var message: String = ""    
    let correctAnswer: String = "Stop trying to solve this case..or I will touch u..The one million incoins are ours! first september is a secret! Haha!" // Correct answer for the anagram

    var body: some View {
        VStack(spacing: 20) {
            Text("What Did He Say?")
                .font(.custom("Menlo", size: 34))
                .bold()
                .foregroundColor(.red)
                .shadow(color: .black, radius: 2, x: 2, y: 2)
                .multilineTextAlignment(.center)
                .padding(.top, 30)
            
            Text("'Stop trying to solve this case..or I will touch u..The imino noell incoins are ours! bereft spermist is a secret! Haha!'")
                .font(.custom("Courier", size: 22))
                .italic()
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .lineSpacing(5)
                .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Decode everything he tried to say:")
                
                ScrollView {
                    TextField("Enter your answer", text: $userAnswer, axis: .vertical)
                        .lineLimit(nil) // Allow for multiple lines
                        .padding()
                        .frame(minHeight: 100) // Set a minimum height for the TextField
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .padding()
                }
                
                Button(action: {
                    checkAnswer()  // Call the function
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
                    .padding(.top, 10)
            }
            .padding()
        }
    }

    func checkAnswer() {
        // Normalize the user input and the correct answer by trimming spaces and lowercasing them
        let normalizedUserAnswer = userAnswer.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        let normalizedCorrectAnswer = correctAnswer.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()

        if normalizedUserAnswer == normalizedCorrectAnswer {
            message = "Correct!"
        } else {
            message = "Incorrect. Try again!"
        }
    }
}

#Preview {
    HackerGameView4()
}
