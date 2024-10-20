//
//  HomeView.swift
//  incproject
//
//  Created by Sharlene Tan Qin Ying on 12/10/24.
//

import SwiftUI

struct HomeView: View {
    @State private var unlockedLevels: [Bool] = [true, false, false, false, false] // Tracks unlocked levels
    @State private var showLockedAlert = false // To show locked message
    @State private var showInfo = false // To show game info pop-up
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Game Levels")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.red)
                    .padding()

                ForEach(1...5, id: \.self) { level in
                    levelButton(level: level, destination: gameView(for: level))
                }

                Spacer()

                Button(action: {
                    showInfo.toggle()
                }) {
                    Text("Game Info & Tips")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(10)
                }
                .popover(isPresented: $showInfo) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Game Info & Tips")
                            .font(.headline)
                            .foregroundColor(.red)
                            .padding(.bottom)

                        Text("1. Explore all clues carefully.")
                        Text("2. Remember to note down all possible clues.")
                        Text("3. This game uses Gen Z knowledge.")
                        Text("4. Don't rush! Take your time.")
                        Text("5. Good luck on your heist!")
                    }
                    .padding()
                    .frame(width: 300)
                    .background(Color.black.opacity(0.9))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
                }
            }
            .padding()
            .alert(isPresented: $showLockedAlert) {
                Alert(
                    title: Text("Not Unlocked Yet!"),
                    message: nil,
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }

    private func gameView(for level: Int) -> some View {
        switch level {
        case 1:
            return AnyView(HackerGameView())
        case 2:
            return AnyView(HackerGameView2())
        case 3:
            return AnyView(HackerGameView4())
        case 4:
            return AnyView(HackerGameView5())
        case 5:
            return AnyView(HackerGameView5())
        default:
            return AnyView(EmptyView())
        }
    }

    private func levelButton(level: Int, destination: some View) -> some View {
        HStack {
            if unlockedLevels[level - 1] {
                NavigationLink(destination: destination) {
                    Text("Level \(level)")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
            } else {
                Button(action: {
                    showLockedAlert = true
                }) {
                    Text("Level \(level)")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
            }

            Button(action: {
            
            }) {
                Image(systemName: "info.circle")
                    .foregroundColor(.white)
                    .padding()
            }
            .background(Color.red)
            .clipShape(Circle())
            .shadow(radius: 5)
        }
    }
}

#Preview {
    HomeView()
}
