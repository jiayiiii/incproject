//
//  HomeView.swift
//  incproject
//
//  Created by Sharlene Tan Qin Ying on 12/10/24.
//
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var gameState: GameState

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.black]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    Text("Welcome to the Game!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                        .multilineTextAlignment(.center)

                    Text("Defeat Tall Avyan and reclaim your incoins!")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 5)
                        .multilineTextAlignment(.center)

                    VStack(spacing: 10) {
                        ForEach(1...10, id: \.self) { level in
                            LevelView(levelNumber: level, isUnlocked: gameState.isLevelUnlocked(level: level)) {
                                gameState.unlockLevel(level: level) // Unlock the level
                            }
                        }
                    }
                    .padding()

                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct LevelView: View {
    let levelNumber: Int
    var isUnlocked: Bool
    var onUnlock: (() -> Void)? // Closure to handle unlocking

    var body: some View {
        HStack {
            Text("Level \(levelNumber):")
                .foregroundColor(.white)
                .font(.headline)

            if isUnlocked {
                Text("Done")
                    .foregroundColor(.green)
                    .fontWeight(.bold)
            } else {
                Text("Unlock")
                    .foregroundColor(.red)
                    .fontWeight(.bold)
            }
            
            Spacer()

            if isUnlocked {
                NavigationLink(destination: nextLevelView(level: levelNumber)) {
                    Text("Play")
                        .padding(5)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
            } else {
                Button(action: {
                    // Call the unlock closure to unlock the level
                    onUnlock?()
                }) {
                    Text("Unlock Level")
                        .padding(5)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
            }
        }
        .padding(.horizontal)
        .background(Color.black.opacity(0.5))
        .cornerRadius(10)
        .padding(.vertical, 5)
    }

    @ViewBuilder
    func nextLevelView(level: Int) -> some View {
        // Replace these with your actual views for each level
        switch level {
        case 1:
            HackerGameView(onComplete: { /* Add your completion logic here */ })
        case 2:
            HackerGameView2(onComplete: { /* Add your completion logic here */ })
        case 3:
            HackerGameView4(onComplete: { /* Add your completion logic here */ })
        case 4:
            Anagram(onComplete: { /* Add your completion logic here */ })
        case 5:
            HackerGameView5(onComplete: { /* Add your completion logic here */ })
        case 6:
            WheelPicker(onComplete: { /* Add your completion logic here */ })

        case 7:
            HackerGameView6(onComplete: { /* Add your completion logic here */ })

        case 8:
            HackerGameView7(onComplete: { /* Add your completion logic here */ })

        //case:9
         // wld fix ltr

//thistoo
        default:
            Text("Coming Soon!")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(GameState())
    }
}
