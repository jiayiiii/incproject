//
//  HomeView.swift
//  incproject
//
//  Created by Sharlene Tan Qin Ying on 12/10/24.
//
import SwiftUI

// Main HomeView
struct HomeView: View {
    @Binding var levelsUnlocked: [Int: Bool]

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.8), Color.black]),
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
                        ForEach(1...10, id: \.self) { levelNumber in
                            LevelView(levelNumber: levelNumber, isUnlocked: Binding(
                                get: { levelsUnlocked[levelNumber, default: false] },
                                set: { levelsUnlocked[levelNumber] = $0 }
                            ))
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
            HackerGameView(onComplete: {})
        case 2:
            HackerGameView2(onComplete: {})
        case 3:
            HackerGameView4(onComplete: {})
        case 4:
            Anagram(onComplete: {})
        case 5:
            HackerGameView5(onComplete: {})
        case 6:
            WheelPicker(onComplete: {})
        case 7:
            HackerGameView6(onComplete: {})
        case 8:
            HackerGameView7(onComplete: {})
        case 9:
            PhoneHackedView()
        case 10:
            HackBattleView()
        case 11:
            BattleGameView()
        case 12:
            CompleteGameView()
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
        10: false,
        11: false
    ]

    static var previews: some View {
        HomeView(levelsUnlocked: $previewLevelsUnlocked)
    }
}
