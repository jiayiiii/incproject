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
    let goalPosition = Position(x: 6, y: 20)

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                Image(systemName: "lock.shield")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.1)
                    .frame(width: 400)
                    .position(x: 200, y: 200)

                VStack {
                    Text("Escape Tall Avyan's HQ!")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                        .bold()
                        .padding(.bottom, 10)

                    Text("Navigate through the maze using WASD keys. Reach the green dot to escape.")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                        .multilineTextAlignment(.center)

                    if gameStarted {
                        ScrollView(.horizontal) {
                            VStack {
                                ForEach(0..<maze.count, id: \.self) { row in
                                    HStack {
                                        ForEach(0..<maze[row].count, id: \.self) { col in
                                            CellView(
                                                isWall: maze[row][col] == 1,
                                                isPlayer: playerPosition.x == row && playerPosition.y == col,
                                                isGoal: goalPosition.x == row && goalPosition.y == col
                                            )
                                            .frame(width: 40, height: 40)
                                            .transition(.scale)
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
                        Button("Start Escape") {
                            withAnimation(.easeIn(duration: 0.5)) {
                                gameStarted = true
                            }
                        }
                        .padding()
                        .font(.title)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                }
                .padding()
                .navigationDestination(isPresented: $navigateToNextView) {
                    PhoneHackedView()
                        .navigationBarBackButtonHidden(true)
                }
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
            withAnimation(.easeInOut(duration: 0.3)) {
                playerPosition = newPosition
            }
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
        case "w": movePlayer(direction: .up)
        case "s": movePlayer(direction: .down)
        case "a": movePlayer(direction: .left)
        case "d": movePlayer(direction: .right)
        default: break
        }
    }
}

struct CellView: View {
    var isWall: Bool
    var isPlayer: Bool
    var isGoal: Bool
    
    var body: some View {
        ZStack {
            if isWall {
                Rectangle()
                    .fill(Color.black)
                    .overlay(Rectangle().stroke(Color.gray, lineWidth: 1))
            } else {
                Rectangle()
                    .fill(Color.white)
                
                if isPlayer {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 30, height: 30)
                        .shadow(color: Color.blue.opacity(0.6), radius: 10)
                        .transition(.scale)
                }
                
                if isGoal {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 30, height: 30)
                        .shadow(color: Color.green.opacity(0.6), radius: 10)
                        .transition(.scale)
                }
            }
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
