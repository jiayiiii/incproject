//
//  incprojectApp.swift
//  incproject
//
//  Created by jia yi on 9/9/24.
//

import SwiftUI

@main
struct incprojectApp: App {
    @StateObject private var gameState = GameState() // Create GameState object

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameState) // Pass GameState to ContentView
        }
    }
}
