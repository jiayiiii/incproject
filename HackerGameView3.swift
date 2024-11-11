//
//  HackerGameView3.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 20/10/24.
//
import SwiftUI
import AVFoundation

class SoundManager1: ObservableObject {
    static let instance = SoundManager1()
    var player: AVAudioPlayer?

    func playSound() {
        guard let url = Bundle.main.url(forResource: "ring", withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}

struct HackerGameView4: View {
    var onComplete: () -> Void
    @State private var showAnagram = false
    @State private var soundManager1 = SoundManager1()

    var body: some View {
        NavigationStack {
            ZStack {
                Image("freakbob")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 440, height: 700)

                HStack {
                    Button(action: {
                        showAlert()
                    }) {
                        HStack {
                            Image(systemName: "xmark")
                                .font(.headline)
                                .foregroundColor(.black)
                            Text("Decline")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.black)
                        }
                        .padding()
                        .padding(.horizontal, 20)
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(.bottom, 30)
                        .position(x: 90, y: 150)
                    }

                    Button(action: {
                        showAnagram = true
                    }) {
                        HStack {
                            Image(systemName: "phone.fill")
                                .font(.headline)
                                .foregroundColor(.black)
                            Text("Answer")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.black)
                        }
                        .padding()
                        .padding(.horizontal, 20)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.bottom, 30)
                        .position(x: 70, y: 150)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .position(x: 250, y: 850)
            }
            .onAppear {
                soundManager1.playSound()
            }
            .navigationDestination(isPresented: $showAnagram) {
                Anagram(onComplete: {
                    onComplete()
                })
            }
        }
    }

    func showAlert() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        if let window = windowScene.windows.first {
            let alert = UIAlertController(title: "Decline failed", message: "Error 404, try the other button", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            window.rootViewController?.present(alert, animated: true, completion: {
                let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
                animation.timingFunction = CAMediaTimingFunction(name: .linear)
                animation.duration = 0.6
                animation.values = [-10, 10, -10, 10, -5, 5, 0]
                window.layer.add(animation, forKey: "shake")
            })
        }
    }
}

struct HackerGameView4_Previews: PreviewProvider {
    static var previews: some View {
        HackerGameView4(onComplete: {

        })
        .previewDevice("iPhone 16") // Adjusted device for preview
    }
}
