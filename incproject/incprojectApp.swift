//
//  incprojectApp.swift
//  incproject
//
//  Created by jia yi on 9/9/24.
//

import SwiftUI

@main
struct incprojectApp: App {
    @StateObject private var gameState = GameState() 

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameState)
        }
    }
}
