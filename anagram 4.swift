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
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Text("What Did He Say?")
                    .font(.custom("Menlo", size: 34))
                    .bold()
                    .foregroundColor(.red)
                    .shadow(color: .black, radius: 5, x: 3, y: 3)
                    .multilineTextAlignment(.center)
                    .padding(.top, 30)

                Text("'Stop trying to solve this case... or I will touch you... The noe liomlin incoins are ours! rifst emspterbe is a secret! Haha!'")
                    .font(.custom("Courier", size: 22))
                    .italic()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineSpacing(5)
                    .padding()
                    .background(Color.red.opacity(0.5))
                    .cornerRadius(10)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Decode what he is trying to say:")
                        .foregroundColor(.white)

                    Text("noe liomlin")
                        .font(.headline)
                        .foregroundColor(.orange)

                    TextField("Enter your first answer", text: $userAnswer)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.gray.opacity(0.8))
                        .cornerRadius(5)

                    Button(action: {
                        checkAnswer()
                    }) {
                        Text("Submit")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.5), radius: 5)
                    }

                    Text(message)
                        .font(.subheadline)
                        .foregroundColor(.yellow)

                    Text("rifst emspterbe")
                        .font(.headline)
                        .foregroundColor(.orange)

                    TextField("Enter your second answer", text: $userAnswerTwo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.gray.opacity(0.8))
                        .cornerRadius(5)

                    Button(action: {
                        checkAnswerTwo()
                    }) {
                        Text("Submit")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.5), radius: 5)
                    }

                    Text(messageTwo)
                        .font(.subheadline)
                        .foregroundColor(.yellow)

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
                .background(Color.black.opacity(0.8))
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.5), radius: 10)
            }
        }
        .navigationTitle("Anagram Game")
        .navigationBarTitleDisplayMode(.inline)
    }

    func checkAnswer() {
        if userAnswer.lowercased() == correctAnswer.lowercased() {
            message = "Correct! But watch your back..."
        } else {
            message = "Incorrect. The clock is ticking!"
        }
        updateBothCorrectStatus()
    }

    func checkAnswerTwo() {
        if userAnswerTwo.lowercased() == correctAnswerTwo.lowercased() {
            messageTwo = "Correct! Keep it together!"
        } else {
            messageTwo = "Incorrect. Don't give up yet!"
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

struct anaInfo: View {
    var body: some View {
        VStack {
            Image("fork")
            Text("Awesome Sauce! You deciphered Freakbob's code. Hmm... This tells us that John Pork isn't the only one working with Tall Avyan. They stole one million Incoins on First September!")
                .font(.largeTitle)
                .foregroundColor(.black)
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)

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
