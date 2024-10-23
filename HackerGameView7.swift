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
    let onComplete: () -> Void

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
        let goalPosition = Position(x: 6, y: 20) // Green dot position

        var body: some View {
            NavigationStack {
                VStack {
                    Text("Goal:")
                        .fontDesign(.monospaced)
                        .font(.largeTitle)
                        .padding()
                        .bold()
                        .foregroundColor(.red)
                    Text("You have entered Tall Avyan's headquaters, the security will come very soon, get out before the timer runs out")
                        .font(.headline)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    Text("Use WASD to move about. The green dot is the exit, no one knows whats lurking behind.")
                        .padding()
                        .fontDesign(.monospaced)
                        

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
                                                            .fill(Color.green)
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
                        .modifier(KeyCommandModifier {
                            handleKeyPress(event: $0)
                        })
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
                checkForWin()
            }
        }

        func checkForWin() {
            if playerPosition == goalPosition {
                navigateToNextView = true
                onComplete()
            }
        }

        func handleKeyPress(event: UIKeyCommand) {
            switch event.input {
            case "w":
                movePlayer(direction: .up)
            case "s":
                movePlayer(direction: .down)
            case "a":
                movePlayer(direction: .left)
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
        HackerGameView7(onComplete: {})
    }
