//
//  Counter.swift
//  ThinkingInSwiftUI
//
//  Created by Jonathan Bones on 17.07.20.
//  Copyright © 2020 bonesyblue. All rights reserved.
//

/**
 Notes:
 - SwiftUI views are immutable descriptions of layout
 - Methods called on a view result in wrapping the view with a ViewModifier. The order matters!
 - Views are laid out in a top-down fashion (outermost VM to innermost View)
 - View updates are triggered by modifying view state properties (@State / @ObservedObject / @EnvironmentObject)
 */

import SwiftUI

struct Counter: View {
    @State var counter = 0
    
    // "some View" is an opaque type, which abstracts away the type complexity of the underlying View subtree.
    var body: some View {
        // VStack View builder
        VStack {
            Button(action: { self.counter += 1 }) {
                Text("Tap me")
                .padding()
                .background(Color(.tertiarySystemFill))
                .cornerRadius(5)
            }
            
            if(counter > 0) {
                Text("You've tapped \(counter) times")
                    .padding()
            } else {
                Text("Tap the button!")
                    .padding()
            }
            
            // Accepted conditional statements within ViewBuilder
            if true {
                Text("Optional Image")
                Image(systemName: "circle")
            }
            
            if false {
                Image(systemName: "cross")
            } else {
                Divider()
            }
        }.frame(width: 200, height: 200)
            .border(Color.black)
            .debug()
    }
}

extension View {
    // Custom view modifier which prints the View tree to the console
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}

struct Counter_Previews: PreviewProvider {
    static var previews: some View {
        Counter()
    }
}
