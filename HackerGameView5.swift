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
                CarPlate(onComplete: onComplete) // Pass the onComplete closure to CarPlate
                    .tabItem {
                        Image(systemName: "archivebox.fill")
                        Text("Image")
                    }
                
                WheelPicker(onComplete: onComplete) // Placeholder custom WheelPicker
                    .tabItem {
                        Image(systemName: "pencil.and.list.clipboard")
                        Text("Picker")
                    }
            }
            .navigationTitle("Hacker Game")
            .accentColor(.red)
        }
    }
}

struct CarPlate: View {
    var onComplete: () -> Void
    @State private var imageScale: CGFloat = 1.0
    @State private var dragOffset = CGSize.zero

    var body: some View {
        VStack {
            Text("Car Plate View")
                .font(.largeTitle)
                .foregroundColor(.red)
                .padding()
                .background(Color.black.opacity(0.8))
                .cornerRadius(10)
                .shadow(color: .red, radius: 10, x: 5, y: 5)

            ZStack {
                // Container for zoomable and draggable image
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

                // Zoom Controls
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        VStack(spacing: 20) {
                            Button(action: {
                                withAnimation {
                                    imageScale = min(imageScale + 0.2, 3.0) // Limit maximum zoom
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
                                    imageScale = max(imageScale - 0.2, 1.0) // Limit minimum zoom
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

            // Completion button with animation
            Button(action: {
                onComplete()
            }) {
                Text("Complete Car Plate Task")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.top, 20)
        }
        .padding()
    }
}

// Example placeholder for WheelPicker view
struct wheelPicker: View {
    var onComplete: () -> Void

    var body: some View {
        VStack {
            Text("Wheel Picker View")
                .font(.largeTitle)
                .padding()

            // Custom wheel picker UI goes here

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
        }
        .padding()
    }
}

#Preview {
    HackerGameView5(onComplete: {})
}
