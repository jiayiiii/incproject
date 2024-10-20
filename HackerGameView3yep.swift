//
//  HackerGameView3yep.swift
//  incproject
//
//  Created by Nadra binte Muhammad Shahril on 20/10/24.
//

import SwiftUI

struct HackerGameView3yep: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.black, .black.opacity(0.8)]),
                           startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)

            VStack{
                Image("freakbob")
                    .resizable()
                    .frame(width: 500,height: 600)
                HStack{
                    NavigationLink(destination: anagram()) {
                        Text("next")
                            .padding()
                            .background(Color.blue.opacity(0.9))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .padding(.top, 20)
                    }
                    Text("pick up?☎️")
                        .padding()
                        .background(Color.green.opacity(0.9))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.top, 20)
                    //can someone make that when u click this, 'threatbob'(in assets), starts playing if possible if not its ok
                }
            }
        }
        }

}

#Preview {
    HackerGameView3yep()
}
