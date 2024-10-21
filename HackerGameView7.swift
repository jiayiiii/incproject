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
    let maze = [
        [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
        [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1],
        [1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1],
        [1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1],
        [1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1],
        [1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1],
        [1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1],
        [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1],
        [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    ]
    
    @State private var playerPosition = Position(x: 1, y: 1)
    @State private var gameStarted = false
    @State private var showWinAlert = false
    let goalPosition = Position(x: 7, y: 9)
    
    var body: some View {
        NavigationView {
            VStack {
                if gameStarted {
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
                                                    .fill(Color.green)
                                                    .frame(width: 30, height: 30)
                                                : nil
                                            )
                                    }
                                }
                            }
                        }
                    }
                    .onChange(of: playerPosition) { oldValue, newValue in
                        checkForWin()
                    }
                    .modifier(KeyCommandModifier {
                        handleKeyPress(event: $0)
                    })
                    
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
                
                if showWinAlert {
                    NavigationLink(destination: BattleGameView()){
                        Text("Proceed to Battle")
                            .padding()
                            .font(.title)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .alert(isPresented: $showWinAlert) {
                Alert(
                    title: Text("Congratulations!"),
                    message: Text("You've reached the goal!"),
                    dismissButton: .default(Text("OK"))
                )
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
        }
    }

    func checkForWin() {
        if playerPosition == goalPosition {
            showWinAlert = true
        }
    }
    
    func handleKeyPress(event: UIKeyCommand) {
        switch event.input {
        case "w":
            movePlayer(direction: .up)
        case "a":
            movePlayer(direction: .left)
        case "s":
            movePlayer(direction: .down)
        case "d":
            movePlayer(direction: .right)
        default:
            break
        }
    }
}

struct KeyCommandModifier: ViewModifier {
    var onKeyPress: (UIKeyCommand) -> Void
    
    func body(content: Content) -> some View {
        content
            .background(KeyCommandView(onKeyPress: onKeyPress))
    }
}

struct KeyCommandView: UIViewControllerRepresentable {
    var onKeyPress: (UIKeyCommand) -> Void

    func makeUIViewController(context: Context) -> KeyCommandViewController {
        let viewController = KeyCommandViewController()
        viewController.onKeyPress = onKeyPress
        return viewController
    }

    func updateUIViewController(_ uiViewController: KeyCommandViewController, context: Context) {}
}

class KeyCommandViewController: UIViewController {
    var onKeyPress: ((UIKeyCommand) -> Void)?

    override var keyCommands: [UIKeyCommand]? {
        return [
            UIKeyCommand(input: "w", modifierFlags: [], action: #selector(handleKeyPress)),
            UIKeyCommand(input: "a", modifierFlags: [], action: #selector(handleKeyPress)),
            UIKeyCommand(input: "s", modifierFlags: [], action: #selector(handleKeyPress)),
            UIKeyCommand(input: "d", modifierFlags: [], action: #selector(handleKeyPress))
        ]
    }

    @objc func handleKeyPress(_ sender: UIKeyCommand) {
        onKeyPress?(sender)
    }
}
#Preview {
    HackerGameView7()
}
