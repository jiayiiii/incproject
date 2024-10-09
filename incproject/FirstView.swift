//
//  FirstView.swift
//  incproject
//
//  Created by jia yi on 8/10/24.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationStack {
               Text("Your goal is to find out")
                .fontWeight(.bold)
                .fontDesign(.serif)
            Text("Who was tall avyan's accomplice?")
                .fontWeight(.bold)
                  .foregroundColor(.red)
                .font(.title2)
                .fontDesign(.serif)
        }
        .navigationTitle("First Minigame")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    FirstView()
}
