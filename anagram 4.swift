//
//  anagram 2.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 20/10/24.
//
//can someone make it so that 'threatbob' in assets is playing in the background🙏
import SwiftUI

struct Anagram: View {
    @State private var anagramOne: String = "imino noell" // The scrambled anagram
    @State private var userAnswer: String = ""  // The user's input for the first anagram
    @State private var message: String = ""     // Message to display result for the first anagram
    let correctAnswer: String = "one million"   // The correct answer for the first anagram
    
    @State private var anagramTwo: String = "bereft spermist" // The scrambled anagram
    @State private var userAnswerTwo: String = ""  // The user's input for the second anagram
    @State private var messageTwo: String = ""     // Message to display result for the second anagram
    let correctAnswerTwo: String = "first september" // The correct answer for the second anagram

    @State private var bothCorrect: Bool = false // To track if both answers are correct

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
                Text("Decode what he is trying to say:")
                
                Text("imino noell")
                    .font(.headline)
                TextField("Enter your first answer", text: $userAnswer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    checkAnswer()  // Check first answer
                }) {
                    Text("Submit")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                
                Text(message) // Display feedback message for first answer
                    .font(.subheadline)
                    .foregroundColor(.blue)
                
                Text("bereft spermist")
                    .font(.headline)
                
                TextField("Enter your second answer", text: $userAnswerTwo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    checkAnswerTwo()  // Check second answer
                }) {
                    Text("Submit")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                
                Text(messageTwo) // Display feedback message for second answer
                    .font(.subheadline)
                    .foregroundColor(.blue)

                // Only show the Next button if both answers are correct
                if bothCorrect {
                    NavigationLink(destination: anaInfo()) {
                        Text("Next")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Anagram Game") // Set the title for the navigation
    }
    
    func checkAnswer() {
        if userAnswer.lowercased() == correctAnswer.lowercased() {
            message = "Correct!"
        } else {
            message = "Incorrect. Try again!"
        }
        updateBothCorrectStatus()
    }
    
    func checkAnswerTwo() {
        if userAnswerTwo.lowercased() == correctAnswerTwo.lowercased() {
            messageTwo = "Correct!"
        } else {
            messageTwo = "Incorrect. Try again!"
        }
        updateBothCorrectStatus()
    }
    
    private func updateBothCorrectStatus() {
        bothCorrect = (userAnswer.lowercased() == correctAnswer.lowercased()) && (userAnswerTwo.lowercased() == correctAnswerTwo.lowercased())
    }
}

// Preview for Anagram
struct Anagram_Previews: PreviewProvider {
    static var previews: some View {
        Anagram()
    }
}
//just like a view for like info
struct anaInfo : View {
    var body: some View {
        VStack {
            Image("fork")
            Text("Awesome Sauce! You deciphered Freakbob's code. Hmm...This tells us that John Pork isn't the only one working with Tall Avyan. They stole one million Incoins on First September!")
                .font(.largeTitle)
                .foregroundColor(.black)
                .padding()
            NavigationLink(destination: HackerGameView5()) {
                Text("Next")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
    }
}
