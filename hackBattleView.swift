//
//  hackBattleView.swift
//  incproject
//
//  Created by Sharlene Tan Qin Ying on 21/10/24.
//
import SwiftUI

import SwiftUI

struct HackBattleView: View {
    @State private var playerHealth = 100
    @State private var opponentHealth = 100
    @State private var isPlayerTurn = true
    @State private var question = "What is the command to print 'Hello, World!' in Swift?"
    @State private var options = ["print('Hello, World!')", "echo 'Hello, World!'", "System.out.println('Hello, World!')", "Console.WriteLine('Hello, World!')"]
    @State private var selectedAnswer: String? = nil
    @State private var resultMessage = ""
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Cybersecurity Game")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                HStack {
                    VStack {
                        Text("You")
                            .font(.headline)
                            .foregroundColor(.green)
                        Text("\(playerHealth) HP")
                            .foregroundColor(.green)
                    }
                    Spacer()
                    VStack {
                        Text("Tall Avyan")
                            .font(.headline)
                            .foregroundColor(.red)
                        Text("\(opponentHealth) HP")
                            .foregroundColor(.red)
                    }
                }
                .padding()
                
                if isPlayerTurn {
                    Text("Your Turn: Answer the question to attack!")
                        .font(.headline)
                        .foregroundColor(.yellow)
                    
                    Text(question)
                        .font(.body)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.gray.opacity(0.8))
                        .cornerRadius(10)
                    
                    VStack(spacing: 10) {
                        ForEach(options, id: \.self) { option in
                            Button(option) {
                                selectedAnswer = option
                                checkAnswer()
                            }
                            .padding()
                            .background(Color.blue.opacity(0.7))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                    }
                } else {
                    Text("Tall Avyan's Turn!")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .onAppear {
                            opponentTurn()
                        }
                }
                
                Text(resultMessage)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding()
        }
        .animation(.easeInOut, value: playerHealth)
        .animation(.easeInOut, value: opponentHealth)
    }
    
    func checkAnswer() {
        if selectedAnswer == "print('Hello, World!')" {
            resultMessage = "Correct! 10 damage to Tall Avyan."
            opponentHealth -= 10
        } else {
            resultMessage = "Incorrect! No damage dealt."
        }
        isPlayerTurn.toggle()
    }
    
    func opponentTurn() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let damage = 10
            resultMessage = "Tall Avyan attacks! You take \(damage) damage."
            playerHealth -= damage
            isPlayerTurn.toggle()
        }
    }
}

#Preview {
    HackBattleView()
}
