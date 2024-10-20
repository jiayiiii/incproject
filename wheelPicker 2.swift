//
//  wheelPicker 2.swift
//  incproject
//
//  Created by Tan Xin Tong Joy on 20/10/24.
//
import SwiftUI

struct WheelPicker: View {
    
    let locations = ["New York", "California", "Texas", "Florida", "Tennessee"]
    
    // The correct answer
    let correctLocation = "Tennessee"
    
    // User's current selection
    @State private var selectedLocation: String = "New York" // Default selection
    
    // Result message to show whether the user is correct or not
    @State private var resultMessage: String = ""
    
    // Information to show when the user gets it correct
    @State private var locationClue: String = ""
    
    var body: some View {
        VStack {
            Text("Where is the car from?")
                .font(.custom("Menlo", size: 34))
                .bold()
                .foregroundColor(.red)
                .shadow(color: .black, radius: 2, x: 2, y: 2)
                .multilineTextAlignment(.center)
                .padding(.top, 30)
            
            Text("Hint: its state bird is a mockingbird.") // Fixed the missing quote
            
            // Picker for selecting the location
            Picker("Select Location", selection: $selectedLocation) {
                ForEach(locations, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(WheelPickerStyle()) // Wheel style picker
            .padding()
            
            // Button to submit the selected location
            Button(action: {
                checkAnswer()  // Check the answer when the button is clicked
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
        }
        .padding()
    }
    
    // Function to check if the selected location is correct
    func checkAnswer() {
        if selectedLocation.isEmpty {
            resultMessage = "Please select a location."
            locationClue = "" // Clear the clue if no selection is made
        } else if selectedLocation == correctLocation {
            resultMessage = "Correct!"
            // Provide extra information when the answer is correct
            locationClue = "Seems like Tall Avyan and his lackeys escaped to Tennessee after their heist."
        } else {
            resultMessage = "Incorrect. Try again!"
            locationClue = "" // Clear the info if the answer is wrong
        }
    }
}

struct WheelPicker_Previews: PreviewProvider {
    static var previews: some View {
        WheelPicker()
    }
}

struct CarPlate: View {
    var body: some View {
        VStack {
            Text("Witnesses on 1st Sept have reported seeing this sussy car near Victoria Falls:")
                .font(.headline)
                .padding()
            Image("car")
                .resizable()
                .frame(width: 450, height: 450)
        }
    }
}

#Preview {
    WheelPicker()
}
