//
//  BattleGameView.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 21/10/24.
//
import SwiftUI

struct Character {
    var name: String
    var health: Int
    var attackPower: Int
    
    mutating func attack(target: inout Character) {
        target.health -= attackPower
    }
}

struct NextBattleView: View {
    @State private var player = Character(name: "Player", health: 100, attackPower: 20)
    @State private var enemy = Character(name: "Tall Avyan", health: 150, attackPower: 25)
    @State private var gameMessage: String = "The battle continues!"
    @State private var gameOver: Bool = false
    @State private var playerTurn: Bool = true
    @State private var attackAnimation: Bool = false
    @State private var victoryMessage: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                Image("battle")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.8)

                VStack(spacing: 20) {
                    Text("Tall Avyan: If you want to get the incoins back, you have to go through me first...")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    CharacterView(character: player, isPlayer: true)

                    CharacterView(character: enemy, isPlayer: false)

                    Text(gameMessage)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(10)
                        .foregroundColor(.white)

                    if !victoryMessage.isEmpty {
                        Text(victoryMessage)
                            .font(.largeTitle)
                            .foregroundColor(.yellow)
                            .padding()
                            .transition(.opacity)
                    }

                    if playerTurn && !gameOver {
                        ActionButtons()
                    }

                    if gameOver {
                        if victoryMessage.isEmpty {
                            Button("Restart") {
                                restartGame()
                            }
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        } else {
                            NavigationLink(destination: CompleteGameView()) {
                                Text("Next")
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                .padding()
                .foregroundColor(.white)
            }
        }
    }

   
    @ViewBuilder
    private func CharacterView(character: Character, isPlayer: Bool) -> some View {
        VStack {
            Text("\(character.name)")
                .font(.largeTitle)
            Text("Health: \(character.health)")
                .font(.title2)
                .foregroundColor(character.health <= 30 ? .red : .black)
            Rectangle()
                .fill(character.health > 0 ? Color.green : Color.red)
                .frame(width: 200, height: 20)
                .overlay(
                    Text("\(character.health)")
                        .foregroundColor(.white)
                )
        }
        .padding()
        .background(isPlayer ? Color.green.opacity(0.7) : Color.red.opacity(0.7))
        .cornerRadius(10)
    }

    @ViewBuilder
    private func ActionButtons() -> some View {
        HStack(spacing: 20) {
            Button("Attack 1") {
                playerAttack()
                playerTurn.toggle()
                aiTurn()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .scaleEffect(attackAnimation ? 1.1 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: attackAnimation)

            Button("Attack 2") {
                specialAttack()
                playerTurn.toggle()
                aiTurn()
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }

    func playerAttack() {
        attackAnimation = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            attackAnimation = false
        }

        enemy.health -= player.attackPower
        gameMessage = "Player used attack 1 on Tall Avyan!"

        if enemy.health <= 0 {
            victoryMessage = "Yayyy! Tall Avyan defeated! You win!"
            gameOver = true
        }
    }

    func specialAttack() {
        attackAnimation = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            attackAnimation = false
        }

        let specialDamage = player.attackPower * 2
        enemy.health -= specialDamage
        gameMessage = "Player used attack 2 on Tall Avyan!"

        if enemy.health <= 0 {
            victoryMessage = "Yayyy! Tall Avyan defeated! You win!"
            gameOver = true
        }
    }

    func aiTurn() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            if gameOver { return }

            attackAnimation = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                attackAnimation = false
            }

            if player.health > 30 {
                player.health -= enemy.attackPower
                gameMessage = "Tall Avyan attacked you!"
            } else {
                player.health -= enemy.attackPower * 2
                gameMessage = "Tall Avyan used a powerful attack!"
            }

            if player.health <= 0 {
                gameMessage = "You are defeated! Game over!"
                gameOver = true
            } else {
                playerTurn = true
            }
        }
    }

    func restartGame() {
        player = Character(name: "Player", health: 100, attackPower: 20)
        enemy = Character(name: "Tall Avyan", health: 150, attackPower: 25)
        gameMessage = "The battle continues!"
        gameOver = false
        playerTurn = true
        victoryMessage = "" // Reset the victory message
    }
}

struct NextBattleView_Previews: PreviewProvider {
    static var previews: some View {
        NextBattleView()
    }
}
