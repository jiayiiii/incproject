//
//  HackerGameView7.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 20/10/24.
//
import SwiftUI

struct Position: Equatable {
    var x: Int
    var y: Int
}

struct HackerGameView7: View {
    let onComplete: () -> Void // Add the onComplete closure

    let maze = [
        [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
        [1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1],
        [1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1],
        [1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1],
        [1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1],
        [1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1],
        [1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1],
        [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    ]
    
    @State private var playerPosition = Position(x: 1, y: 1)
    @State private var gameStarted = false
    @State private var navigateToNextView = false
    let goalPosition = Position(x: 2, y: 0) // Green dot position

    var body: some View {
        NavigationStack {
            VStack {
                Text("Goal:")
                    .bold()
                    .foregroundColor(.red)
                Text("Reach the green dot to go to the next room")
                    .foregroundColor(.green)

                if gameStarted {
                    ScrollView(.horizontal) {
                        VStack {
                            ForEach(0..<maze.count, id: \.self) { row in
                                HStack {
                                    ForEach(0..<maze[row].count, id: \.self) { col in
                                        if maze[row][col] == 1 {
                                            Rectangle()
                                                .fill(Color.black)
                                                .frame(width: 40, height: 40)
                                        } else {
                                            Rectangle()
                                                .fill(Color.white)
                                                .frame(width: 40, height: 40)
                                                .overlay(
                                                    playerPosition.x == row && playerPosition.y == col ?
                                                    Circle()
                                                        .fill(Color.blue)
                                                        .frame(width: 30, height: 30)
                                                    : nil
                                                )
                                                .overlay(
                                                    goalPosition.x == row && goalPosition.y == col ?
                                                    Circle()
                                                        .fill(Color.green) // Green dot for finish
                                                        .frame(width: 30, height: 30)
                                                    : nil
                                                )
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                    HStack {
                        Button("Up") {
                            movePlayer(direction: .up)
                        }
                        Button("Left") {
                            movePlayer(direction: .left)
                        }
                        Button("Down") {
                            movePlayer(direction: .down)
                        }
                        Button("Right") {
                            movePlayer(direction: .right)
                        }
                    }
                } else {
                    Button("Continue") {
                        gameStarted = true
                    }
                    .padding()
                    .font(.title)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .navigationDestination(isPresented: $navigateToNextView) {
                PhoneHackedView()
            }
        }
    }

    enum Direction {
        case up, down, left, right
    }

    func movePlayer(direction: Direction) {
        let newPosition: Position
        
        switch direction {
        case .up:
            newPosition = Position(x: playerPosition.x - 1, y: playerPosition.y)
        case .down:
            newPosition = Position(x: playerPosition.x + 1, y: playerPosition.y)
        case .left:
            newPosition = Position(x: playerPosition.x, y: playerPosition.y - 1)
        case .right:
            newPosition = Position(x: playerPosition.x, y: playerPosition.y + 1)
        }
        
        if maze.indices.contains(newPosition.x),
           maze[newPosition.x].indices.contains(newPosition.y),
           maze[newPosition.x][newPosition.y] == 0 {
            playerPosition = newPosition
            checkForWin() // Check for win condition
        }
    }

    func checkForWin() {
        if playerPosition == goalPosition {
            navigateToNextView = true // Set to true to trigger navigation
            onComplete() // Call onComplete when the player reaches the goal
        }
    }
}

#Preview {
    HackerGameView7(onComplete: {})
}
