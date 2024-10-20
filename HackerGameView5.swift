//
//  HackerGameView5.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 20/10/24.
//


import SwiftUI

struct HackerGameView5: View {
    var body: some View {
        NavigationStack {
            TabView {
                CarPlate()
                    .tabItem {
                        Image(systemName: "archivebox.fill")
                        Text("Image")
                    }
                
                WheelPicker()
                    .tabItem {
                        Image(systemName: "pencil.and.list.clipboard")
                        Text("Picker")
                    }
            }
            .navigationTitle("Hacker Game")
        }
    }
}

#Preview {
    HackerGameView5()
}
