//
//  GameState.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 22/10/24.
//


import SwiftUI
import Combine

class GameState: ObservableObject {
    @Published var levelsUnlocked: [Bool] = Array(repeating: false, count: 10)

    func unlockLevel(level: Int) {
        guard level > 0 && level <= 10 else { return }
        levelsUnlocked[level - 1] = true
    }
    
    func isLevelUnlocked(level: Int) -> Bool {
        guard level > 0 && level <= 10 else { return false }
        return levelsUnlocked[level - 1]
    }
}
