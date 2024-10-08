//
//  ContentView.swift
//  incproject
//
//  Created by youngliz lover on 9/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Im hungry")
                .fontDesign(.monospaced)
                .bold()
                .font(.largeTitle)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
