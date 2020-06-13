//
//  ContentView.swift
//  Splitter
//
//  Created by Vadym Hordov on 2020-06-10.
//  Copyright © 2020 Vadym Hordov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
//    Homework 2 in comments!
    
    var body: some View {
        NavigationView {
            Form {
                Section {
//                    This section should also have a header
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
//                    It can be a text field with number keyboard
//                    But to indicate that it is a number of people it should be a separate section with a header
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
//                We can also add a separate section that will contain a segmented picker that will display a list of emojis***
//                indicating the level of service
                
//                We can also add another section that will contain a text box where user can provide notes
                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("Splitter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
