//
//  1.1 view .swift
//  incproject
//
//  Created by Sharlene Tan Qin Ying on 9/10/24.
//

import SwiftUI

struct __1_view_: View {
    var body: some View {
        Text("The Mysterious Hacker")
            .font(.largeTitle)
            .fontDesign(.monospaced)
            .foregroundColor(.red)
            .bold()
        Text("The hacker, code-named --- was found inside the system numerous time. There was no suspicious activity before... Here is the detais we know about ---. Good Luck!")
            .font(.title)
            .fontDesign(.monospaced)
            .padding(10)
        Text("- Agent Z")
        
    }
}

#Preview {
    __1_view_()
}
