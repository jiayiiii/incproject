import SwiftUI

struct HackerGameView4: View {
    var body: some View {
        ZStack {
            Image("freakbob")
                .resizable()
                .scaledToFill()
                .frame(width: 500, height: 900)
                .clipped()
            
            NavigationLink(destination: Anagram()) {
                HStack {
                    Image(systemName: "phone.fill") // Phone icon
                        .font(.headline) // Adjust font size for the icon
                        .foregroundColor(.black) // Color for the icon
                    
                    Text("Answer")
                        .font(.system(size: 24, weight: .bold)) // Increased font size for the text
                        .foregroundColor(.black)
                }
                .padding() // Default padding around the button
                .padding(.horizontal, 30) // Add horizontal padding to make the button wider
                .background(Color.green)
                .cornerRadius(10)
                .padding(.bottom, 30) // Add bottom padding to position it from the bottom of the screen
                .frame(maxWidth: .infinity, alignment: .trailing) // Align the button to the right
            }
        }
    }
}

#Preview {
    HackerGameView4()
}
