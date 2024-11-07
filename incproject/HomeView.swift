//
//  HomeView.swift
//  incproject
//
//  Created by Sharlene Tan Qin Ying on 12/10/24.
//
import SwiftUI

struct HomeView: View {
    @Binding var levelsUnlocked: [Int: Bool]

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

                    // Manually created LevelView instances
                    VStack(spacing: 10) {
                        LevelView(levelNumber: 1, isUnlocked: $levelsUnlocked[ 1, default: false])
                        LevelView(levelNumber: 2, isUnlocked: $levelsUnlocked[2, default: false])
                        LevelView(levelNumber: 3, isUnlocked: $levelsUnlocked[3, default: false])
                        LevelView(levelNumber: 4, isUnlocked: $levelsUnlocked[4, default: false])
                        LevelView(levelNumber: 5, isUnlocked: $levelsUnlocked[5, default: false])
                        LevelView(levelNumber: 6, isUnlocked: $levelsUnlocked[6, default: false])
                        LevelView(levelNumber: 7, isUnlocked: $levelsUnlocked[7, default: false])
                        LevelView(levelNumber: 8, isUnlocked: $levelsUnlocked[8, default: false])
                        LevelView(levelNumber: 9, isUnlocked: $levelsUnlocked[9, default: false])
                        LevelView(levelNumber: 10, isUnlocked: $levelsUnlocked[10, default: false])
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
    @Binding var isUnlocked: Bool

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
                Text("Not Unlocked Yet")
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
            }
        }
        .padding(.horizontal)
        .background(Color.black.opacity(0.5))
        .cornerRadius(10)
        .padding(.vertical, 5)
    }

    @ViewBuilder
    func nextLevelView(level: Int) -> some View {
        switch level {
        case 1:
            Text("HackerGameView Level 1") // Placeholder for `HackerGameView`
        case 2:
            Text("HackerGameView Level 2") // Placeholder for `HackerGameView2`
        case 3:
            Text("HackerGameView Level 4") // Placeholder for `HackerGameView4`
        case 4:
            Text("Anagram Game")           // Placeholder for `Anagram`
        case 5:
            Text("HackerGameView Level 5") // Placeholder for `HackerGameView5`
        case 6:
            Text("Wheel Picker Game")      // Placeholder for `WheelPicker`
        case 7:
            Text("HackerGameView Level 6") // Placeholder for `HackerGameView6`
        case 8:
            Text("HackerGameView Level 7") // Placeholder for `HackerGameView7`
        default:
            Text("Coming Soon!")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    @State static var previewLevelsUnlocked = [
        1: true,
        2: false,
        3: false,
        4: false,
        5: false,
        6: false,
        7: false,
        8: false,
        9: false,
        10: false
    ]

    static var previews: some View {
        HomeView(levelsUnlocked: $previewLevelsUnlocked)
    }
}
