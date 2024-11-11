//
//  anagram 2.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 20/10/24.
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
    @State private var navigateToInfo = false
    @State private var incorrectAttempt: Bool = false
    @State private var scaleEffect: CGFloat = 1.0
    @State private var glowEffect: Bool = false

    var onComplete: () -> Void

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                    .overlay(
                        RadialGradient(gradient: Gradient(colors: [.black, .red.opacity(0.3), .black]), center: .center, startRadius: 100, endRadius: 400)
                    )

                VStack(spacing: 30) {
                    Text("What Did He Say?")
                        .font(.custom("Menlo", size: 34))
                        .bold()
                        .foregroundColor(.red)
                        .shadow(color: glowEffect ? .red : .black, radius: 10, x: 5, y: 5)
                        .padding(.top, 30)
                        .scaleEffect(glowEffect ? 1.1 : 1.0)
                        .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: glowEffect)
                        .onAppear { glowEffect = true }

                    Text("'Stop trying to solve this case... or I will touch you... The noe liomlin incoins are ours! rifst emspterbe is a secret!Haha!'")
                        .font(.custom("Courier", size: 22))
                        .italic()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color.red.opacity(0.4))
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 5)
                        .scaleEffect(glowEffect ? 1.05 : 1)
                        .animation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true), value: glowEffect)

                    VStack(alignment: .leading, spacing: 20) {
                        Text("Decode what he is trying to say:")
                            .foregroundColor(.white)

                        anagramView(
                            anagram: anagramOne,
                            answer: $userAnswer,
                            message: $message,
                            checkAction: checkAnswer
                        )

                        anagramView(
                            anagram: anagramTwo,
                            answer: $userAnswerTwo,
                            message: $messageTwo,
                            checkAction: checkAnswerTwo
                        )

                        if bothCorrect {
                            Button(action: {
                                navigateToInfo = true
                            }) {
                                Text("Next")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.green)
                                    .cornerRadius(12)
                                    .shadow(color: .black.opacity(0.8), radius: 10, x: 5, y: 5)
                            }
                            .scaleEffect(scaleEffect)
                            .animation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true), value: bothCorrect)
                        }
                    }
                    .padding()
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(20)
                    .shadow(color: .red.opacity(0.8), radius: 15, x: 0, y: 5)
                }
            }
            .navigationTitle("Anagram Game")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $navigateToInfo) {
                anaInfo(onComplete: onComplete)
            }
        }
    }

    func checkAnswer() {
        if userAnswer.lowercased() == correctAnswer.lowercased() {
            message = "Correct! But watch your back..."
            withAnimation(.easeInOut) { incorrectAttempt = false }
        } else {
            message = "Incorrect. The clock is ticking!"
            withAnimation(.default.repeatCount(5, autoreverses: true)) { incorrectAttempt = true }
        }
        updateBothCorrectStatus()
    }

    func checkAnswerTwo() {
        if userAnswerTwo.lowercased() == correctAnswerTwo.lowercased() {
            messageTwo = "Correct! Keep it together!"
            withAnimation(.easeInOut) { incorrectAttempt = false }
        } else {
            messageTwo = "Incorrect. Don't give up yet!"
            withAnimation(.default.repeatCount(5, autoreverses: true)) { incorrectAttempt = true }
        }
        updateBothCorrectStatus()
    }

    private func updateBothCorrectStatus() {
        bothCorrect = (userAnswer.lowercased() == correctAnswer.lowercased()) && (userAnswerTwo.lowercased() == correctAnswerTwo.lowercased())
        if bothCorrect {
            onComplete()
        }
    }

    private func anagramView(anagram: String, answer: Binding<String>, message: Binding<String>, checkAction: @escaping () -> Void) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(anagram)
                .font(.headline)
                .foregroundColor(.orange)

            TextField("Enter your answer", text: answer)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(Color.gray.opacity(0.8))
                .cornerRadius(10)
                .shadow(color: .red.opacity(incorrectAttempt ? 0.8 : 0), radius: 5, x: incorrectAttempt ? 5 : 0, y: 0) 
                .animation(.easeInOut, value: incorrectAttempt)

            Button(action: checkAction) {
                Text("Submit")
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.5), radius: 5)
            }
            .scaleEffect(scaleEffect)
            .animation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true), value: answer.wrappedValue.isEmpty == false)

            Text(message.wrappedValue)
                .font(.subheadline)
                .foregroundColor(.yellow)
                .transition(.opacity)
                .animation(.easeInOut, value: message.wrappedValue)
        }
    }
}

struct anaInfo: View {
    var onComplete: () -> Void

    var body: some View {
        VStack {
            Image("fork")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            Text("Awesome Sauce! You deciphered Freakbob's code. Hmm... This tells us that John Pork isn't the only one working with Tall Avyan. They stole one million Incoins on First September!")
                .font(.largeTitle)
                .foregroundColor(.black)
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)

            NavigationLink(destination: HackerGameView5(onComplete: onComplete)) {
                Text("Next")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.5), radius: 5)
            }
        }
        .onAppear {
            onComplete()
        }
        .padding()
    }
}

#Preview {
    Anagram(onComplete: {})
}
