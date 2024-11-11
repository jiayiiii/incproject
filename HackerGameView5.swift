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
<<<<<<< Updated upstream
                
=======

>>>>>>> Stashed changes
                WheelPicker(onComplete: onComplete)
                    .tabItem {
                        Image(systemName: "dial.fill")
                        Text("Wheel Picker")
                    }
            }
            .navigationTitle("Hacker Game")
<<<<<<< Updated upstream
            .accentColor(.red)
=======
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .background(Color.blue) // Dark blue background for the entire TabView
            .cornerRadius(15)
            .shadow(radius: 5) // Optional: add shadow for a sleek look
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure TabView fills the screen
>>>>>>> Stashed changes
        }
    }
}

<<<<<<< Updated upstream
struct CarPlate: View {
    var onComplete: () -> Void
    @State private var imageScale: CGFloat = 1.0
    @State private var dragOffset = CGSize.zero
=======
// Updated CarPlate view with text field validation
struct CarPlate: View {
    var onComplete: () -> Void

    @State private var inputText: String = ""
    @State private var isInputCorrect: Bool? = nil // Track whether the input is correct

    let correctPlateNumber = "TEN1796"
>>>>>>> Stashed changes

    var body: some View {
        VStack {
            Text("Car Plate Challenge")
                .font(.largeTitle)
<<<<<<< Updated upstream
                .foregroundColor(.red)
                .padding()
                .background(Color.black.opacity(0.8))
                .cornerRadius(10)
                .shadow(color: .red, radius: 10, x: 5, y: 5)

            ZStack {
                Image("car")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(imageScale)
                    .offset(dragOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in dragOffset = value.translation }
                            .onEnded { _ in dragOffset = .zero }
                    )
                    .padding()
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 5)

                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        VStack(spacing: 20) {
                            Button(action: {
                                withAnimation {
                                    imageScale = min(imageScale + 0.2, 3.0)
                                }
                            }) {
                                Image(systemName: "plus.magnifyingglass")
                                    .font(.largeTitle)
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .clipShape(Circle())
                                    .shadow(radius: 5)
                            }

                            Button(action: {
                                withAnimation {
                                    imageScale = max(imageScale - 0.2, 1.0)
                                }
                            }) {
                                Image(systemName: "minus.magnifyingglass")
                                    .font(.largeTitle)
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .clipShape(Circle())
                                    .shadow(radius: 5)
                            }
                        }
                        .padding()
                    }
                }
            }
            Button(action: {
                onComplete()
=======
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, 20)

            Image("car") // Assuming you have a car image in your assets
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
                .shadow(radius: 10)
                .padding(.top, 20)

            Text("Enter the car plate number to complete the task!")
                .font(.subheadline)
                .foregroundColor(.white)
                .padding(.vertical, 20)

            // TextField for user input
            TextField("Enter plate number", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .frame(width: 300)

            // Display feedback on whether the input is correct
            if let isInputCorrect = isInputCorrect {
                Text(isInputCorrect ? "Correct!" : "Incorrect, try again.")
                    .foregroundColor(isInputCorrect ? .green : .red)
                    .font(.headline)
                    .padding(.top, 10)
            }

            // Completion button with modern styling
            Button(action: {
                if inputText.uppercased() == correctPlateNumber {
                    isInputCorrect = true
                    // Call onComplete when the task is completed
                    onComplete()
                } else {
                    isInputCorrect = false
                }
>>>>>>> Stashed changes
            }) {
                Text("Submit Plate Number")
                    .font(.headline)
                    .foregroundColor(.white)
<<<<<<< Updated upstream
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.top, 20)
        }
        .padding()
    }
}


struct wheelPicker: View {
    var onComplete: () -> Void

    var body: some View {
        VStack {
            Text("Wheel Picker View")
                .font(.largeTitle)
                .padding()

            Button(action: {
                onComplete()
            }) {
                Text("Complete Picker Task")
                    .font(.headline)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.top, 20)
=======
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(LinearGradient(colors: [Color.blue, Color.red], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(15)
                    .shadow(radius: 5)
            }
            .padding(.horizontal, 40)
            .padding(.top, 20)

            Spacer()
>>>>>>> Stashed changes
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
