//
//  anagram 2.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 20/10/24.
//
//can someone make it so that 'threatbob' in assets is playing in the background🙏
import SwiftUI

struct Anagram: View {
    @State private var anagramOne: String = "noe liomlin"
    @State private var userAnswer: String = ""
    @State private var message: String = ""
    let correctAnswer: String = "one million"
    @State private var anagramTwo: String = "rifst emspterbe"
    @State private var userAnswerTwo: String = ""
    @State private var messageTwo: String = ""
    let correctAnswerTwo: String = "first september"
    @State private var bothCorrect: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("What Did He Say?")
                .font(.custom("Menlo", size: 34))
                .bold()
                .foregroundColor(.red)
                .shadow(color: .black, radius: 2, x: 2, y: 2)
                .multilineTextAlignment(.center)
                .padding(.top, 30)
            
            Text("'Stop trying to solve this case..or I will touch u..The noe liomlin incoins are ours! rifst emspterbe is a secret! Haha!'")
                .font(.custom("Courier", size: 22))
                .italic()
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .lineSpacing(5)
                .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Decode what he is trying to say:")
                
                Text("noe liomlin")
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
                
                Text("rifst emspterbe")
                    .font(.headline)
                
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
        .navigationTitle("Anagram Game")
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


struct Anagram_Previews: PreviewProvider {
    static var previews: some View {
        Anagram()
    }
}

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
