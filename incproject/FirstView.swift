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
            Text("Who was tall avyan's accomplice?")
                .fontWeight(.bold)
        }
        .navigationTitle("First Minigame")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    FirstView()
}
