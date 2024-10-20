//
//  HackerGameView3.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 20/10/24.
//
import SwiftUI

struct HackerGameView4: View {


    var body: some View {
        VStack{
            Image("freakbob")
                .resizable()
                .frame(width: 500, height: 600)
            
                NavigationLink(destination: Anagram()){
                    Text("pick up")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
            
            
                }
 
            }
                    }
    




#Preview {
    HackerGameView4()
}
