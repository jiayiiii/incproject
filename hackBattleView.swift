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
    @State private var question = "What is the command to print 'Hello, World!' in Swift?"
    @State private var options = ["print('Hello, World!')", "echo 'Hello, World!'", "System.out.println('Hello, World!')", "Console.WriteLine('Hello, World!')"]
    @State private var selectedAnswer: String? = nil
    @State private var questionDifficulty = 1 // 1 for easy, 2 for medium, 3 for hard
    @State private var showAttackResult = false
    @State private var attackMessage = ""

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .gray]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                Text("Cybersecurity Challenge")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)

                HStack {
                    VStack {
                        Text("You")
                            .font(.title)
                            .foregroundColor(.green)
                        ProgressBar(health: playerHealth, color: .green)
                        Text("\(playerHealth) HP")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    VStack {
                        Text("Tall Avyan")
                            .font(.title)
                            .foregroundColor(.red)
                        ProgressBar(health: opponentHealth, color: .red)
                        Text("\(opponentHealth) HP")
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 40)

                if isPlayerTurn {
                    Text("Your Turn: Attack or Defend!")
                        .font(.headline)
                        .foregroundColor(.yellow)

                    QuestionView(question: question, options: options, selectedAnswer: $selectedAnswer) {
                        checkAnswer()
                    }

                    HStack {
                        Button(action: {
                            questionDifficulty = 1
                            loadQuestion(difficulty: questionDifficulty)
                        }) {
                            Text("Easy Attack")
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        Button(action: {
                            questionDifficulty = 2
                            loadQuestion(difficulty: questionDifficulty)
                        }) {
                            Text("Medium Attack")
                                .padding()
                                .background(Color.orange)
                                .cornerRadius(10)
                        }
                        Button(action: {
                            questionDifficulty = 3
                            loadQuestion(difficulty: questionDifficulty)
                        }) {
                            Text("Hard Attack")
                                .padding()
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                    }
                }

                if showAttackResult {
                    Text(attackMessage)
                        .foregroundColor(.white)
                        .transition(.scale)
                }
            }
            .padding()
        }
        .animation(.easeInOut, value: isPlayerTurn)
    }

    // Load question based on difficulty level
    func loadQuestion(difficulty: Int) {
        question = difficulty == 1 ? "What is Swift's keyword for declaring variables?" : difficulty == 2 ? "How do you declare a constant in Swift?" : "What does 'optional' mean in Swift?"
        options = difficulty == 1 ? ["let", "var", "func", "if"] : difficulty == 2 ? ["const", "let", "def", "int"] : ["nullable variable", "type that can be nil", "automatic null check", "none of the above"]
    }

    // Check the answer, calculate damage or defense
    func checkAnswer() {
        if let answer = selectedAnswer {
            if answer == correctAnswer() {
                attackMessage = "Correct! \(damageAmount()) damage dealt to Tall Avyan!"
                opponentHealth -= damageAmount()
                withAnimation {
                    isPlayerTurn = false
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    performOpponentTurn()
                }
            } else {
                attackMessage = "Incorrect! You missed the attack!"
            }
            selectedAnswer = nil
            showAttackResult.toggle()
        }
    }

    // Opponent's turn
    func performOpponentTurn() {
        attackMessage = "Tall Avyan attacks!"
        playerHealth -= damageAmount()
        isPlayerTurn = true
        showAttackResult.toggle()
    }

    // Returns correct answer based on question difficulty
    func correctAnswer() -> String {
        return questionDifficulty == 1 ? "var" : questionDifficulty == 2 ? "let" : "type that can be nil"
    }

    // Damage calculation
    func damageAmount() -> Int {
        return questionDifficulty * 10
    }
}

struct ProgressBar: View {
    var health: Int
    var color: Color

    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(color)
                .frame(width: geometry.size.width * CGFloat(health) / 100, height: geometry.size.height)
                .animation(.easeInOut, value: health)
                .cornerRadius(8)
        }
        .frame(height: 10)
    }
}

struct QuestionView: View {
    var question: String
    var options: [String]
    @Binding var selectedAnswer: String?
    var onAnswerSelected: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(question)
                .font(.headline)
                .foregroundColor(.white)

            ForEach(options, id: \.self) { option in
                Button(action: {
                    selectedAnswer = option
                    onAnswerSelected()
                }) {
                    Text(option)
                        .padding()
                        .background(Color.gray.opacity(selectedAnswer == option ? 0.8 : 0.3))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    HackBattleView()
}
