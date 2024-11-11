//
//  HackerGameView5.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 20/10/24.
//
import SwiftUI

struct HackerGameView5: View {
    var onComplete: () -> Void

    var body: some View {
        NavigationStack {
            TabView {
                CarPlate(onComplete: onComplete)
                    .tabItem {
                        Image(systemName: "car.fill")
                        Text("Car Plate")
                    }
                
                WheelPicker(onComplete: onComplete)
                    .tabItem {
                        Image(systemName: "dial.fill")
                        Text("Wheel Picker")
                    }
            }
            .navigationTitle("Hacker Game")
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .background(Color.blue)
            .cornerRadius(15)
            .shadow(radius: 5)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct CarPlate: View {
    var onComplete: () -> Void

    @State private var inputText: String = ""
    @State private var isInputCorrect: Bool? = nil
    let correctPlateNumber = "TEN1796"

    var body: some View {
        VStack {
            Text("Car Plate Challenge")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, 20)

            Image("car")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
                .shadow(radius: 10)
                .padding(.top, 20)

            Text("Enter the car plate number to complete the task!")
                .font(.subheadline)
                .foregroundColor(.white)
                .padding(.vertical, 20)

            TextField("Enter plate number", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .frame(width: 300)

            if let isInputCorrect = isInputCorrect {
                Text(isInputCorrect ? "Correct!" : "Incorrect, try again.")
                    .foregroundColor(isInputCorrect ? .green : .red)
                    .font(.headline)
                    .padding(.top, 10)
            }

            Button(action: {
                if inputText.uppercased() == correctPlateNumber {
                    isInputCorrect = true
                    onComplete()
                } else {
                    isInputCorrect = false
                }
            }) {
                Text("Submit Plate Number")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(LinearGradient(colors: [Color.blue, Color.red], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(15)
                    .shadow(radius: 5)
            }
            .padding(.horizontal, 40)
            .padding(.top, 20)

            Spacer()
        }
        .padding()
    }
}
struct HackerGameView5_Previews: PreviewProvider {
    static var previews: some View {
        HackerGameView5(onComplete: {
            print("Task completed!")
        })
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
