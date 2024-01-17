//
//  TipCalculator.swift
//  SwiftUITutorial
//
//  Created by Capatina Ionut on 17.01.2024.
//

import SwiftUI

struct TipCalculator: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    let tipPercentages = [10,15,20,25,0]
    
    var totalTip: Double{
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    var totalPerPerson: Double{
        //calculate total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View{
        NavigationStack{
            Form{
                Section{
                    TextField("Amount ", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "$")).keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people ", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }.pickerStyle(.menu)
                }
                Section("How much do you want to tip ?"){
                    Picker("Tip percentage ", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                                
                        }
                    }
                    .pickerStyle(.segmented)
                    .background(Color.green)
                    .opacity(0.75)
                }.cornerRadius(15)
                Section{
                    Text(totalPerPerson , format: .currency(code: Locale.current.currency?.identifier ?? "$")).font(.title)
                }
                Section{
                    Text(totalTip , format: .currency(code: Locale.current.currency?.identifier ?? "$")).font(.title)
                }
            }.navigationTitle("TipCalculator")
                .toolbar{
                    if amountIsFocused{
                        HStack{
                        Button{
                            amountIsFocused = false
                        }label:{
                            Text("Done").foregroundColor(.white)
                        }.buttonStyle(.borderedProminent)
                                .accentColor(.green).cornerRadius(15)
                        }
                    }
                }
        }
    }
}

#Preview {
    TipCalculator()
}
