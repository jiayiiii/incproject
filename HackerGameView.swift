//
//  HackerGameView.swift
//  incproject
//
//  Created by Sharlene Tan Qin Ying on 9/10/24.
//

import SwiftUI

struct HintsView: View {
    let hints: [String]

    var body: some View {
        VStack {
            Text("Hints")
                .font(.largeTitle)
                .padding()

            ForEach(hints, id: \.self) { hint in
                Text("- \(hint)")
                    .font(.headline)
                    .padding()
            }

            Spacer()
        }
        .padding()
    }
}

struct HackerGameView: View {
    @State private var codeInput = ""
    @State private var hintUnlocked = false
    @State private var incorrectCode = false
    @State private var attempts = 0
    @State private var showHintAlert = false
    @State private var showingHints = false

    // Correct code to unlock the hint
    let correctCode = "john pork"

    let hints = [
        "The accomplice has a hybrid nature.",
        "Their favorite color is pink.",
        "The heist was near Victoria Falls."
    ]

    var body: some View {
        NavigationStack {
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
                    Text("Correct! His accomplice was John Pork. HINT: The heist took place in a city well known for its attraction Victoria Falls.")
                        .font(.headline)
                        .foregroundColor(.green)
                        .transition(.opacity)
                        .multilineTextAlignment(.center)
                    Image("john_pork.png")
                        .resizable()
                        .frame(width:100,height:100)
                        .cornerRadius(10)

                    NavigationLink(destination: HackerGameView2()) {
                        Text("Go to Hacker Game 2")
                            .padding()
                            .background(Color.mainGreen)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.top, 20)
                    }
                } else {
                    TextField("Enter code to unlock hint", text: $codeInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .keyboardType(.default)

                    Button(action: {
                        if codeInput.lowercased() == correctCode {
                            withAnimation {
                                hintUnlocked = true
                                incorrectCode = false
                            }
                        } else {
                            incorrectCode = true
                            attempts += 1
                            if attempts >= 5 {
                                showHintAlert = true
                                attempts = 0
                            }
                        }
                    }) {
                        Text("Submit Code")
                            .padding()
                            .background(Color.mainGreen)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    if incorrectCode {
                        //errorororo
                        Text("Incorrect code. Try again.")
                            .foregroundColor(.red)
                            .transition(.opacity)
                    }
                }
            }
            .padding()
            .alert("Hint", isPresented: $showHintAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("brainrot, oink oink!!!")
            }
            .navigationTitle("Hacker Game")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingHints.toggle()
                    }) {
                        Text("Quit")
                    }
                    .sheet(isPresented: $showingHints) {
                        HintsView(hints: hints)
                    }
                }
            }
        }
    }
}

#Preview {
    HackerGameView()
}
