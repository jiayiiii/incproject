//
//  HackerGameView6.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 20/10/24.
//
import SwiftUI

struct HackerGameView6: View {
    @State private var playerMoney: Int = 500
    @State private var ticketPrice: Int = 200
    @State private var ticketsBought: Int = 0
    @State private var gameMessage: String = ""
    @State private var isGameOver: Bool = false
    @State private var showAlert: Bool = false
    @State private var showContinueButton: Bool = false
    var onComplete: () -> Void 

    var body: some View {
        NavigationStack {
            ZStack {
                Image("airport image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 1300, height: 2000)
                    .clipped()
                
                VStack {
                    VStack {
                        Text("Buy an airplane ticket?")
                            .font(.largeTitle)
                            .padding()
                        
                        Text("Costs $\(ticketPrice)")
                            .font(.title)
                            .padding()

                        Text("You have $\(playerMoney)")
                            .font(.title2)
                            .padding()
                        
                        Text("Tickets bought: \(ticketsBought)")
                            .font(.title2)
                            .padding()
                    }
                    .background(RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white.opacity(0.8))
                        .shadow(radius: 10)
                    )
                    .padding()

                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 2)
                        .padding(.horizontal)
                    
                    if !gameMessage.isEmpty {
                        Text(gameMessage)
                            .font(.headline)
                            .foregroundColor(isGameOver ? .red : .green)
                            .padding()
                    }
                    
                    HStack {
                        Button(action: {
                            buyTicket()
                        }) {
                            Text("Yes")
                                .font(.title)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .accessibilityLabel("Buy ticket")
                        }

                        Button(action: {
                            gameMessage = "Lol, you failed the game!"
                            isGameOver = true
                            showAlert = true
                            showContinueButton = false
                        }) {
                            Text("No")
                                .font(.title)
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .accessibilityLabel("Decline ticket")
                        }
                    }
                    .padding()
                    
                    if showContinueButton {
                        NavigationLink(destination: HackerGameView7(onComplete: {

                            print("Proceeding to HackerGameView7")
                        })) {
                            Text("Continue")
                                .font(.title)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Game Over"),
                    message: Text(ticketsBought >= 3 ? "Why did you buy 3 or more tickets? You're in debt now lol. Good luck!" : "Lol, you failed the game!"),
                    dismissButton: .default(Text("Try again, maybe try the other option"))
                )
            }
        }
    }

    private func buyTicket() {
        if playerMoney >= ticketPrice {
            playerMoney -= ticketPrice
            ticketsBought += 1
            gameMessage = "You bought the ticket! Click 'Continue' to proceed."
            isGameOver = false
            showAlert = false
            showContinueButton = ticketsBought < 3
            
            if ticketsBought < 3 {
                onComplete()
            } else {

                gameMessage = "You've bought 3 tickets. You cannot buy more!"
                isGameOver = true
                showAlert = true
                showContinueButton = false
            }
        } else {
            gameMessage = "You don't have enough money! You failed the game lol."
            isGameOver = true
            showAlert = true
            showContinueButton = false
        }
    }
}

#Preview {
    HackerGameView6(onComplete: {})
}
