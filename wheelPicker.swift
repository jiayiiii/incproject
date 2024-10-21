//
//  wheelPicker.swift
//  incproject
//
//  Created by Nadra binte Muhammad Shahril on 20/10/24.
//

import SwiftUI
struct wheelPicker: View {
    
    let locations = ["New York", "California", "Texas", "Florida", "Tennessee"]
    
    let correctLocation = "Tennessee"
    
    @State private var selectedLocation: String = ""
    
    @State private var resultMessage: String = ""
    
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
        }
        .padding()
    }
    
    func checkAnswer() {
        if selectedLocation == correctLocation {
            resultMessage = "Correct!"

            locationClue = "Seems like Tall Avyan and his lackeys escaped to Tennesse after their heist"
        } else {
            resultMessage = "Incorrect. Try again!"
            locationClue = ""
        }
    }
}
struct picker_Previews: PreviewProvider {
    static var previews: some View {
        wheelPicker()
    }
}
struct pickerView_Previews: PreviewProvider {
    static var previews: some View {
        wheelPicker()
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
#Preview {
    wheelPicker()
}
