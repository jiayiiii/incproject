//
//  HackerGameView5.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 20/10/24.
//
import SwiftUI

struct HackerGameView5: View {
    var onComplete: () -> Void // Add the onComplete closure

    var body: some View {
        NavigationStack {
            TabView {
                CarPlate(onComplete: onComplete) // Pass the onComplete closure to CarPlate
                    .tabItem {
                        Image(systemName: "archivebox.fill")
                        Text("Image")
                    }
                
                WheelPicker(onComplete: onComplete) // Use your custom WheelPicker
                    .tabItem {
                        Image(systemName: "pencil.and.list.clipboard")
                        Text("Picker")
                    }
            }
            .navigationTitle("Hacker Game")
        }
    }
}

// Example implementation of CarPlate
struct CarPlate: View {
    var onComplete: () -> Void // Add the onComplete closure

    var body: some View {
        VStack {
            Text("Car Plate View")
                .font(.largeTitle)
                .padding()

            // Example completion button
            Button(action: {
                // Call onComplete when the task is completed
                onComplete()
            }) {
                Text("Complete Car Plate Task")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    HackerGameView5(onComplete: {})
}
