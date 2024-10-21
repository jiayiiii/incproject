//
//  anagram(HGV3).swift
//  incproject
//
//  Created by Nadra binte Muhammad Shahril on 19/10/24.
//

import SwiftUI

struct anagram_HGV3_: View {
    @State private var ansInput = ""
    @State private var hintUnlocked = false
    @State private var incorrectAns = false
    @State private var attempts = 0
    @State private var feedbackMessage: String = ""
    @State private var userInput: String = ""
    let correctAns = ["Stop trying to solve this case..or I will touch you..The one million incoins are ours! First September is a secret!Haha!","One million,First September"]

    var body: some View {
        VStack {
        Text("What does he mean?")
            .font(.custom("Menlo", size: 34))
            .bold()
            .foregroundColor(.red)
            .multilineTextAlignment(.center)
            .padding(.top, 30)
            Text("'Stop trying to solve this case..or I will touch you..The imino Noell incoins are ours!bereft spermist is a secret! Haha!'")
                .font(.custom("Courier", size: 22))
                .italic()
                .bold()
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .lineSpacing(5)
                .padding()
            if hintUnlocked {
                Text("AWESOME SAUCE.They stole 1 million incoins from the company! And looks like John Pork isn't the only one helping Tall Avyan..")
                    .font(.custom("Courier", size: 20))
                    .foregroundColor(.green)
                    .transition(.opacity)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.green, lineWidth: 1)
                            .shadow(color: .green, radius: 2)
                    )
                Image("fork")
                NavigationLink(destination:HackerGameView()) {
                    Text("Go to the Next Level")
                        .padding()
                        .background(Color.red.opacity(0.9))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.top, 20)
                }
            } else {
                TextField("Enter the Meaning", text: $ansInput)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
                    .shadow(color: .gray, radius: 4)
            } 
           
            Button(action: {
                checkAnswer()
            }) {
                Text("Submit")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            Text(feedbackMessage)
                .font(.headline)
                .foregroundColor(feedbackMessage == "Correct!" ? .green : .red)
                .padding()
        }
        .padding()
    }

    func checkAnswer() {
        if correctAns.contains(userInput) {
            feedbackMessage = "Correct!"
        } else {
            feedbackMessage = "Incorrect code. Try again."
        }
        userInput = ""
    }

    }


#Preview {
    anagram_HGV3_()
}
