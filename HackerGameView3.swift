import SwiftUI

struct HackerGameView3: View {
    @State private var userAnswer: String = ""  // The user's input for the first anagram
    @State private var userAnswerTwo: String = ""  // The user's input for the second anagram
    @State private var message: String = ""     // Message to display result for the first anagram
    @State private var messageTwo: String = ""  // Message to display result for the second anagram
    
    let correctAnswer: String = "one million"   // The correct answer for the first anagram
    let correctAnswerTwo: String = "first september" // The correct answer for the second anagram

    var body: some View {
        VStack(spacing: 20) {
            Text("What Did He Say?")
                .font(.custom("Menlo", size: 34))
                .bold()
                .foregroundColor(.red)
                .shadow(color: .black, radius: 2, x: 2, y: 2)
                .multilineTextAlignment(.center)
                .padding(.top, 30)
            
            Text("'Stop trying to solve this case..or I will touch u..The imino noell incoins are ours! bereft spermist is a secret! Haha!'")
                .font(.custom("Courier", size: 22))
                .italic()
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .lineSpacing(5)
                .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Decode what he is trying to say:")
                
                Text("imino noell")
                    .font(.headline)
                TextField("Enter your first answer", text: $userAnswer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    checkAnswer()  // Calling the function
                }) {
                    Text("Submit")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                
                Text(message) // Display feedback message
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .padding(.bottom, 20)
                
                Text("bereft spermist")
                    .font(.headline)
                
                TextField("Enter your second answer", text: $userAnswerTwo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    checkAnswerTwo()  // Calling the function
                }) {
                    Text("Submit")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                
                Text(messageTwo) // Display feedback message
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
            .padding()
        }
    }
    
    func checkAnswer() {
        if userAnswer.lowercased() == correctAnswer.lowercased() {
            message = "Correct!"
        } else {
            message = "Incorrect. Try again!"
        }
    }
    
    func checkAnswerTwo() {
        if userAnswerTwo.lowercased() == correctAnswerTwo.lowercased() {
            messageTwo = "Correct!"
        } else {
            messageTwo = "Incorrect. Try again!"
        }
    }
}

#Preview {
    HackerGameView3()
}
