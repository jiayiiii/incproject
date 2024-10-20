//
//  HackerGameView3.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 20/10/24.
//
import SwiftUI

struct HackerGameView4: View {
    @State private var showAnagram = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("freakbob")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 500, height: 900)
                    .clipped()

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
                        .padding(.horizontal, 30)
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(.bottom, 30)
                        .position(x: 130, y: 450)
                    }

                    Button(action: {
                        showAnagram = true // Navigate to HackerGameView5
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
                        .padding(.horizontal, 30)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.bottom, 30)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .position(x: 250, y: 850)
            }
            .navigationDestination(isPresented: $showAnagram) {
                Anagram()
            }
        }
    }

    func showAlert() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        if let window = windowScene.windows.first {
            let alert = UIAlertController(title: "Oops!", message: "You can't decline!", preferredStyle: .alert)
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

#Preview {
    HackerGameView4()
}
