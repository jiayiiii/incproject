//
//  CompleteGameView.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 21/10/24.
//
import SwiftUI

struct CompleteGameView: View {
    var body: some View {
        VStack {
            Text("Congratulations!")
                .font(.largeTitle)
                .padding()

            Text("You have completed the game!")
                .font(.headline)
                .padding()
        }
    }
}

struct CompleteGameView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteGameView()
    }
}

