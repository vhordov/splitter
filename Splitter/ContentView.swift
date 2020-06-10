//
//  ContentView.swift
//  Splitter
//
//  Created by Vadym Hordov on 2020-06-10.
//  Copyright © 2020 Vadym Hordov. All rights reserved.
//

// Homework #1

// Adjust the following content view to include the following items inside form:
// 1. Text with some greeting message
// 2. 3 TextFields - for first name, last name, email (those should be states)
// 3. Text that will display Full name
// 4. Create an array of fishname names called "fish"
// 5. Create picker that would allow users to select a fish from that array
// Note: The whole view must be a Navigation view with a Large title.

import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0
    @State private var name: String = ""
    var greeting: String = "Hello World!"
    let friends = ["Dima", "Vadya", "Vova"]
    @State private var selectedFriend = 0
    
    var body: some View {
        NavigationView {
            Form {
                Text(greeting)
//                Two-way binding (read & write):
                TextField("Enter your name", text: $name)
//                One-way binding (read only):
                Button("Tap Count \(count)") {
                    self.count += 1
                }
                Picker("Select your friend", selection: $selectedFriend) {
                    ForEach(0 ..< friends.count) {
                       number in Text(self.friends[number])
                    }
                }
                Text("Your selected friend: Friend #\(friends[selectedFriend])")
            }
            .navigationBarTitle("Title", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
