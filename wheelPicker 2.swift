//
//  wheelPicker 2.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 20/10/24.
//
import SwiftUI

struct WheelPicker: View {
    
    let locations = ["New York", "California", "Texas", "Florida", "Tennessee"]
    let correctLocation = "Tennessee"
    
    @State private var selectedLocation: String = "New York"
    @State private var resultMessage: String = ""
    @State private var locationClue: String = ""
    @State private var isCorrect: Bool = false
    
    var body: some View {
        VStack {
            Text("Where is the car from?")
                .font(.custom("Menlo", size: 34))
                .bold()
                .foregroundColor(.red)
                .shadow(color: .black, radius: 2, x: 2, y: 2)
                .multilineTextAlignment(.center)
                .padding(.top, 30)
            
            Text("Hint: its state bird is a mockingbird.")
                .font(.body)
                .padding(.bottom, 20)
            
            Picker("Select Location", selection: $selectedLocation) {
                ForEach(locations, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .padding()
            
            Button(action: {
                checkAnswer()
            }) {
                Text("Submit")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding()
            
            Text(resultMessage)
                .font(.subheadline)
                .foregroundColor(resultMessage == "Correct!" ? .green : .red)
                .padding()
   
            if !locationClue.isEmpty {
                Text(locationClue)
                    .font(.body)
                    .padding()
                    .foregroundColor(.blue)
            }
            
           
            if isCorrect {
                NavigationLink(destination: HackerGameView6()) {
                    Text("Next")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                .accessibilityLabel("Proceed to the next challenge")
            }
        }
        .padding()
    }
    
    func checkAnswer() {
        if selectedLocation.isEmpty {
            resultMessage = "Please select a location."
            locationClue = ""
            isCorrect = false
        } else if selectedLocation == correctLocation {
            resultMessage = "Correct!"
            locationClue = "Seems like Tall Avyan and his lackeys escaped to Tennessee after their heist."
            isCorrect = true
        } else {
            resultMessage = "Incorrect. Try again!"
            locationClue = ""
            isCorrect = false
        }
    }
}

struct WheelPicker_Previews: PreviewProvider {
    static var previews: some View {
        WheelPicker()
    }
}
struct carPlate : View {
    var body: some View {
        VStack{
            Text("Witnesses on 1st Sept have reported seeing this sussy car near Victoria Falls:")
                .font(.headline)
                .padding()
            Image("car")
                .resizable()
                .frame(width: 450,height: 450)
            }
    }
}
