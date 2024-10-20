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
    @State private var revealedHints: Set<Int> = []
    @State private var audioPlayer: AVAudioPlayer?
    
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
                    .padding(.bottom, 30)

                    HStack {
                        TextField("Ask John Pork...", text: $playerMessage)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(.black)
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

                    // Button to go to the next view
                    NavigationLink(destination: HackerGameView3()) {
                        Text("Go to Next Game")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                    .padding(.bottom)
                }
            }
            .onAppear {
                loadMessages()
                playBackgroundSound()
            }
            .onDisappear {
                stopBackgroundSound()
            }
        }
    }

    private func sendMessage() {
        if !playerMessage.isEmpty {
            messages.append("You: \(playerMessage)")
            playerMessage = ""
saveMessages()

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                let responseIndex = revealedHints.count
                if responseIndex < johnPorkResponses.count {
                    let response = johnPorkResponses[responseIndex]
                    messages.append("John Pork: \(response)")

                    
                    revealedHints.insert(responseIndex)

                  
                    if revealedHints.count == johnPorkResponses.count {
                        messages.append("John Pork Hint: \(johnPorkHint)")                     }
                }

             
                saveMessages()
            }
        }
    }

    private func saveMessages() {
        UserDefaults.standard.set(messages, forKey: "savedMessages")
    }

    private func loadMessages() {
        if let savedMessages = UserDefaults.standard.stringArray(forKey: "savedMessages") {
            messages = savedMessages
        }
    }

    private func playBackgroundSound() {
        let soundName = "sound1" // Replace with your sound file name
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("Oops! The sound isn't working")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        } catch {
            print("ERROR: \(error.localizedDescription)")
        }
    }

    private func stopBackgroundSound() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
}

// Preview for HackerGameView2
struct HackerGameView2_Previews: PreviewProvider {
    static var previews: some View {
        HackerGameView2()
    }
}
struct HackerGameView3: View {
    var body: some View {
        Text("Welcome to HackerGameView3, make sure that you have gathered all 5 clues from minigame 2 before you proceed... All the best...")
            .font(.largeTitle)
            .foregroundColor(.black)
            .padding()
        NavigationLink(destination: HackerGameView4()){
            Text("continue")
                .font(.headline)
                .foregroundColor(.black)
                .padding()
                .background(Color.green)
                .cornerRadius(10)
        }
        
    }
    
}
