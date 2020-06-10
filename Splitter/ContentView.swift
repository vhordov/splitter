//
//  ContentView.swift
//  Splitter
//
//  Created by Vadym Hordov on 2020-06-10.
//  Copyright © 2020 Vadym Hordov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0
    @State private var name: String = ""
    @State private var greeting: String = "Hello World!"
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
