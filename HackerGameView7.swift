//
//  HackerGameView7.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 20/10/24.
//
import SwiftUI

// Custom struct for positions in the maze
struct Position: Equatable {
    var x: Int
    var y: Int
}

struct HackerGameView7: View {
    // Larger Maze Structure (1 = wall, 0 = path)
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
    
    @State private var playerPosition = Position(x: 1, y: 1) // Initial Player Position
    @State private var gameStarted = false // Controls whether the game has started
    @State private var showWinAlert = false // Controls the win notification
    
    let goalPosition = Position(x: 7, y: 9) // Goal position in the maze
    
    // For scrolling the maze view
    @State private var scrollOffset = CGSize.zero
    
    var body: some View {
        VStack {
            if gameStarted {
                ScrollView([.horizontal, .vertical]) {
                    VStack {
                        ForEach(0..<maze.count, id: \.self) { row in
                            HStack {
                                ForEach(0..<maze[row].count, id: \.self) { col in
                                    if maze[row][col] == 1 {
                                        Rectangle()
                                            .fill(Color.black) // Wall
                                            .frame(width: 40, height: 40)
                                    } else {
                                        Rectangle()
                                            .fill(Color.white) // Path
                                            .frame(width: 40, height: 40)
                                            .overlay(
                                                playerPosition.x == row && playerPosition.y == col ?
                                                Circle()
                                                    .fill(Color.blue)
                                                    .frame(width: 30, height: 30) // Player
                                                : nil
                                            )
                                            .overlay(
                                                goalPosition.x == row && goalPosition.y == col ?
                                                Circle()
                                                    .fill(Color.green)
                                                    .frame(width: 30, height: 30) // Goal
                                                : nil
                                            )
                                    }
                                }
                            }
                        }
                    }
                    .offset(x: scrollOffset.width, y: scrollOffset.height)
                    .animation(.easeInOut(duration: 0.3), value: scrollOffset)
                }
                .onChange(of: playerPosition) { oldValue, newValue in
                    adjustScrollForPlayerPosition()
                    checkForWin()
                }
                
                // Capture key presses for movement using custom key command modifier
                .modifier(KeyCommandModifier {
                    handleKeyPress(event: $0)
                })
                
                // Placeholder for movement buttons (not needed if you are using WASD)
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
                // Show the Continue button before the game starts
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
        .alert(isPresented: $showWinAlert) {
            Alert(
                title: Text("Congratulations!"),
                message: Text("You've reached the goal!"),
                dismissButton: .default(Text("OK"))
            )
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
        
        // Ensure the player doesn't move through walls
        if maze.indices.contains(newPosition.x),
           maze[newPosition.x].indices.contains(newPosition.y),
           maze[newPosition.x][newPosition.y] == 0 {
            playerPosition = newPosition
        }
    }

    // Adjusts the scroll view offset based on player position
    func adjustScrollForPlayerPosition() {
        // Threshold for scrolling when the player gets near the edge of the visible area
        let threshold: CGFloat = 160
        
        // Calculate the offset to keep the player near the center of the view
        if playerPosition.x * 40 < Int(threshold) {
            scrollOffset.height = max(scrollOffset.height + 40, 0)
        } else if playerPosition.x * 40 > Int(UIScreen.main.bounds.height - threshold) {
            scrollOffset.height = min(scrollOffset.height - 40, CGFloat(maze.count) * 40 - UIScreen.main.bounds.height)
        }
        
        if playerPosition.y * 40 < Int(threshold) {
            scrollOffset.width = max(scrollOffset.width + 40, 0)
        } else if playerPosition.y * 40 > Int(UIScreen.main.bounds.width - threshold) {
            scrollOffset.width = min(scrollOffset.width - 40, CGFloat(maze[0].count) * 40 - UIScreen.main.bounds.width)
        }
    }

    // Check if the player has reached the goal
    func checkForWin() {
        if playerPosition == goalPosition {
            showWinAlert = true
        }
    }
    
    // Handle key presses for "W", "A", "S", "D"
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

// MARK: - Key Command Modifier for Capturing Key Presses

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
