//
//  HackerGameView2.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 9/10/24.
//

import SwiftUI
import AVFoundation

struct HackerGameView2: View {
    @State private var messages: [String] = []
    @State private var playerMessage = ""
    @State private var johnPorkResponses = [
        "You will never find out the truth...",
        "The heist... It was all a setup...",
        "You should leave before it's too late.",
        "Fine... I'll tell you. But it won’t save you..."
    ]
    @State private var johnPorkHint = "It happened near a famous waterfall."
    @State private var revealHint = false
    
    // Sound effect player
    var backgroundSound: AVAudioPlayer?
    var responseSound: AVAudioPlayer?
    
    init() {
        // Load background creepy sound
        self.backgroundSound = createSoundPlayer(forResource: "creepyBackground", type: "mp3")
        backgroundSound?.numberOfLoops = -1 // Loop indefinitely
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Dark, eerie background
                LinearGradient(gradient: Gradient(colors: [.black, .gray.opacity(0.8)]),
                               startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 15) {
                            // Display messages
                            ForEach(messages, id: \.self) { message in
                                Text(message)
                                    .font(.system(size: 18, weight: .medium, design: .monospaced))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black.opacity(0.7))
                                    .cornerRadius(10)
                                    .shadow(color: .black, radius: 4)
                                    .transition(.opacity)
                            }
                        }
                        .padding()
                    }
                    
                    Spacer()
                    
                    // Player's input field and send button
                    HStack {
                        TextField("Ask John Pork...", text: $playerMessage)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 5)
                        
                        Button(action: {
                            sendMessage()
                        }) {
                            Text("Send")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                }
            }
            .onAppear {
                // Play background sound on launch
                backgroundSound?.play()
            }
        }
    }
    
    private func sendMessage() {
        if !playerMessage.isEmpty {
            // Add player's message
            messages.append("You: \(playerMessage)")
            playerMessage = ""
            
            // Trigger John Pork's response
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                let response = johnPorkResponses.randomElement() ?? "..."
                messages.append("John Pork: \(response)")
                
                if response == johnPorkResponses.last {
                    revealHint = true
                }
                
                playResponseSound() // Play response sound
            }
        }
    }
    
    private func playResponseSound() {
        responseSound = createSoundPlayer(forResource: "creepyResponse", type: "mp3")
        responseSound?.play()
    }
}

// Utility function to create a sound player
func createSoundPlayer(forResource: String, type: String) -> AVAudioPlayer? {
    guard let path = Bundle.main.path(forResource: forResource, ofType: type) else { return nil }
    let url = URL(fileURLWithPath: path)
    do {
        let audioPlayer = try AVAudioPlayer(contentsOf: url)
        return audioPlayer
    } catch {
        print("Error loading sound: \(error)")
        return nil
    }
}

// Preview for HackerGameView2
struct HackerGameView2_Previews: PreviewProvider {
    static var previews: some View {
        HackerGameView2()
    }
}
#Preview {
    HackerGameView2()
}
