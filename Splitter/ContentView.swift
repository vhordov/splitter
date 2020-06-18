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
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    @State private var satisfactionSelection = 1
    @State private var comment = ""
    let tipPercentages = [10, 15, 20, 25, 0]
    let satisfactionSelections = ["😃", "🙂", "🙁"]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 1 
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Cheque Total")) {

                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                }
                
            
                Section(header: Text("Number of People")) {

                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
                Section(header: Text("Rate Our Service")) {
                    Picker("Satisfaction Level", selection: $satisfactionSelection) {
                        ForEach(0 ..< satisfactionSelections.count) {
                            Text("\(self.satisfactionSelections[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Comments")) {
                    TextField("Leave your comments", text: $comment)
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
