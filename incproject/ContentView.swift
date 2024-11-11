import SwiftUI

struct ContentView: View {

    @State private var levelsUnlocked: [Int: Bool] = [
        1: true,
        2: false,
        3: false,
        4: false,
        5: false,
        6: false,
        7: false,
        8: false,
        9: false,
        10: false
    ]

    var body: some View {
        TabView {
            NavigationStack {
                ZStack {
                    Image("wallpaper")
                        .resizable()
                        .scaledToFill()
                        .scaledToFit()
                        .frame(width: 1400)
                        .edgesIgnoringSafeArea(.all)
                    LinearGradient(gradient: Gradient(colors: [.white, .mainGreen]), startPoint: .top, endPoint: .bottom)
                        .opacity(0.2)

                    VStack {
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 300, height: 200)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .overlay(
                                VStack {
                                    Text("The Incoin Heist!")
                                        .bold()
                                        .font(.largeTitle)
                                        .foregroundColor(.black)
                                        .padding()

                                    NavigationLink {
                                        FirstView()
                                    } label: {
                                        Text("Start")
                                            .fontWeight(.heavy)
                                            .padding()
                                            .background(Color.mainGreen)
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                    }
                                }
                            )
                    }
                    .padding()
                }
                .edgesIgnoringSafeArea(.all)
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }

            HomeView(levelsUnlocked: $levelsUnlocked)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("HomeView")
                }
        }
    }
}

#Preview {
    ContentView()
}
