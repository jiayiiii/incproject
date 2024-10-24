//
//  HackerGameView.swift
//  incproject
//
//  Created by Sharlene Tan Qin Ying on 9/10/24.
//
import SwiftUI
import AVFAudio

struct HackerGameView: View {
    @State private var codeInput = ""
    @State private var hintUnlocked = false
    @State private var incorrectCode = false
    @State private var attempts = 0
    @State private var showHintAlert = false
    @State private var quitMessageVisible = false
    @State private var audioPlayer: AVAudioPlayer!
    @State private var timer: Timer?

    let correctCodes = ["john pork", "johnpork"]
    let hints = [
        "The accomplice has a hybrid nature.",
        "Their favorite color is pink.",
        "The heist was near Victoria Falls."
    ]

    // Add onComplete closure
    var onComplete: () -> Void

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.black, Color.gray.opacity(0.8)]),
                    startPoint: .top, endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    Text("THE MYSTERIOUS HACKER")
                        .font(.custom("Menlo", size: 34))
                        .bold()
                        .foregroundColor(.red)
                        .shadow(color: .black, radius: 2, x: 2, y: 2)
                        .multilineTextAlignment(.center)
                        .padding(.top, 30)

                    Text("Tall Avyan's accomplice was a hybrid of human and something else, standing at 8 feet tall. His favorite color is... pink.")
                        .font(.custom("Courier", size: 22))
                        .italic()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .lineSpacing(5)
                        .padding()

                    if hintUnlocked {
                        Text("CORRECT. The accomplice was John Pork.\nHINT: The heist took place near Victoria Falls.")
                            .font(.custom("Courier", size: 20))
                            .foregroundColor(.green)
                            .transition(.opacity)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.green, lineWidth: 1)
                                    .shadow(color: .green, radius: 2)
                            )
                            .padding(.bottom, 20)

                        Image("john_pork.png")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 5, x: 0, y: 5)

                        // Updated NavigationLink to the next level
                        NavigationLink(destination: HackerGameView2(onComplete: onComplete)) {
                            Text("Go to the Next Level")
                                .padding()
                                .background(Color.red.opacity(0.9))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .padding(.top, 20)
                        }
                    } else {
                        TextField("Enter the code", text: $codeInput)
                            .textFieldStyle(PlainTextFieldStyle())
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(10)
                            .padding(.horizontal, 40)
                            .shadow(color: .gray, radius: 4)

                        Button(action: {
                            if correctCodes.contains(codeInput.lowercased()) {
                                withAnimation {
                                    hintUnlocked = true
                                    incorrectCode = false

                                    // Call the onComplete closure
                                    onComplete()

                                    let soundName = "sound0"
                                    if let soundFile = NSDataAsset(name: soundName) {
                                        do {
                                            audioPlayer = try AVAudioPlayer(data: soundFile.data)
                                            audioPlayer.play()

                                            timer = Timer.scheduledTimer(withTimeInterval: 8.0, repeats: false) { _ in
                                                audioPlayer.stop()
                                            }
                                        } catch {
                                            print("ERROR: \(error.localizedDescription) creating audioPlayer.")
                                        }
                                    } else {
                                        print("Could not find sound file named \(soundName).")
                                    }
                                }
                            } else {
                                incorrectCode = true
                                attempts += 1
                                if attempts >= 5 {
                                    showHintAlert = true
                                    attempts = 0
                                }
                            }
                        }) {
                            Text("Submit Code")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.red.opacity(0.9))
                                .cornerRadius(10)
                                .shadow(color: .black, radius: 4)
                        }

                        if incorrectCode {
                            Text("Incorrect code. Try again.")
                                .foregroundColor(.red)
                                .transition(.opacity)
                        }
                    }

                    if quitMessageVisible {
                        Text("You can't quit!")
                            .font(.headline)
                            .foregroundColor(.red)
                            .transition(.opacity)
                            .padding(.top, 20)
                    }
                }
                .padding()
            }
            .alert("Hint", isPresented: $showHintAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("brainrot, oink oink!!!")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation {
                            quitMessageVisible = true
                        }
                    }) {
                        Text("Quit")
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                    }
                }
            }
        }
        .onDisappear {
            timer?.invalidate()
            audioPlayer?.stop()
        }
    }
}

#Preview {
    HackerGameView(onComplete: { }) // Provide a dummy closure for the preview
}
