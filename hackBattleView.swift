//
//  hackBattleView.swift
//  incproject
//
//  Created by Sharlene Tan Qin Ying on 21/10/24.
//
import SwiftUI

struct HackBattleView: View {
    @State private var playerHealth = 100
    @State private var opponentHealth = 100
    @State private var isPlayerTurn = true
    @State private var selectedAnswer: String? = nil
    @State private var resultMessage = ""
    @State private var gameOverMessage = ""
    @State private var navigateToCompleteView = false

    struct Question {
        let text: String
        let options: [String]
        let correctAnswer: String
        let difficulty: Int
    }
    
    private let questions = [
        Question(
            text: "What is the command to print 'Hello, World!' in Swift?",
            options: ["print('Hello, World!')", "echo 'Hello, World!'", "System.out.println('Hello, World!')", "Console.WriteLine('Hello, World!')"],
            correctAnswer: "print('Hello, World!')",
            difficulty: 1
        ),
        Question(
            text: "How do you declare a constant in Swift?",
            options: ["let", "const", "var", "define"],
            correctAnswer: "let",
            difficulty: 2
        ),
        Question(
            text: "Which keyword is used for error handling in Swift?",
            options: ["try", "catch", "throw", "guard"],
            correctAnswer: "try",
            difficulty: 3
        )
    ]
    
    @State private var currentQuestionIndex = 0
    
    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }
    
    var body: some View {
        
        
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("HACK BATTLE: Wh0 1s 4 b3tter c0d3r?")
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
                                .scaleEffect(playerHealth <= 20 ? 1.2 : 1.0)
                                .animation(.spring(), value: playerHealth)
                        }
                        Spacer()
                        VStack {
                            Text("Tall Avyan")
                                .font(.headline)
                                .foregroundColor(.red)
                            Text("\(opponentHealth) HP")
                                .foregroundColor(.red)
                                .scaleEffect(opponentHealth <= 20 ? 1.2 : 1.0)
                                .animation(.spring(), value: opponentHealth)
                        }
                    }
                    .padding()
                    
                    if gameOverMessage.isEmpty {
                        if isPlayerTurn {
                            Text("Your Turn: Answer the question to attack!")
                                .font(.headline)
                                .foregroundColor(.yellow)
                            
                            Text(currentQuestion.text)
                                .font(.body)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.gray.opacity(0.8))
                                .cornerRadius(10)
                            
                            VStack(spacing: 10) {
                                ForEach(currentQuestion.options, id: \.self) { option in
                                    Button(option) {
                                        selectedAnswer = option
                                        checkAnswer()
                                    }
                                    .padding()
                                    .background(Color.blue.opacity(0.7))
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                    .animation(.easeInOut, value: selectedAnswer)
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
                    } else {
                        Text(gameOverMessage)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                            .background(gameOverMessage.contains("won") ? Color.green : Color.red)
                            .cornerRadius(10)
                            NavigationLink(destination: CompleteGameView()) {
                                Text("What's next?")
                            }
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .font(.title2)
                        }
                    }
                    
                    Text(resultMessage)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                }
                .padding()
            }
            .onAppear {
                nextQuestion()
            }
        }
    func nextQuestion() {
        currentQuestionIndex = Int.random(in: 0..<questions.count)
    }
    
    func checkForGameOver() {
        if opponentHealth <= 0 {
            gameOverMessage = "You won! Tall Avyan has been defeated!"
        
        } else if playerHealth <= 0 {
            gameOverMessage = "Game Over! Tall Avyan has won!"
        }
    }
    
    func checkAnswer() {
        if selectedAnswer == currentQuestion.correctAnswer {
            let damage = currentQuestion.difficulty * 10
            resultMessage = "Correct! \(damage) damage to Tall Avyan."
            opponentHealth -= damage
            checkForGameOver()
        } else {
            resultMessage = "Incorrect! No damage dealt."
        }
        
        withAnimation(.easeInOut) {
            isPlayerTurn.toggle()
        }
        nextQuestion()
    }
    
    func opponentTurn() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let damage = Int.random(in: 10...20)
            resultMessage = "Tall Avyan attacks! You take \(damage) damage."
            playerHealth -= damage
            checkForGameOver()
            
            withAnimation(.easeInOut) {
                isPlayerTurn.toggle()
            }
            nextQuestion()
        }
    }
    
    func nextQuestion() {
        currentQuestionIndex = Int.random(in: 0..<questions.count)
    }
    
    func checkForGameOver() {
        if opponentHealth <= 0 {
            gameOverMessage = "You won! Tall Avyan has been defeated!"
        
        } else if playerHealth <= 0 {
            gameOverMessage = "Game Over! Tall Avyan has won!"
        }
    }
    
    
    


#Preview {
    HackBattleView()
}
