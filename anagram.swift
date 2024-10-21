//
//  anagram.swift
//  incproject
//
//  Created by Nadra binte Muhammad Shahril on 20/10/24.
//

import SwiftUI

struct anagram: View {
    @State private var anagramOne: String = "imino noell"
    @State private var userAnswer: String = ""
    @State private var message: String = ""
    let correctAnswer: String = "one million"
    @State private var anagramTwo: String = "bereft spermist"
    @State private var userAnswerTwo: String = ""
    @State private var messageTwo: String = ""
    let correctAnswerTwo: String = "first september"
    
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
                                checkAnswer()
                            }) {
                                Text("Submit")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.red)
                                    .cornerRadius(10)
                            }
                            
                            Text(message)
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                
                
                TextField("Enter your second answer", text: $userAnswerTwo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            Button(action: {
                            checkAnswerTwo()
                        }) {
                            Text("Submit")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                        
                        Text(messageTwo)
                            .font(.subheadline)
                            .foregroundColor(.blue)
                
                
            }
        
        
        
        
    }

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
