//
//  Home.swift
//  MYH Fitness&Health
//
//  Created by Capatina Ionut on 05.11.2023.
//

import SwiftUI
import Foundation

struct Home: View {
    @State private var varsta: Double = 0
    @State private var inaltime:Double = 0
    @State private var greutate:Double = 0
    @State private var sex:Int = 1
    @State private var forma: String  = ""
    @State private var valoare: Double = 0
    @State private var poza:String = "logo2"
    
    var body:some View{
        NavigationView {
            VStack {
                Image("\(poza)").resizable().scaledToFit()
                Text("Your form is: \(forma)")
                HStack{
                    Text("Age:")
                    Slider(value: $varsta, in: 0...100)
                    Text("\(varsta, specifier: "%.0f") years ")
                }.padding()
                HStack{
                    Text("Height:")
                    Slider(value: $inaltime, in: 30...220)
                    Text("\(inaltime, specifier: "%.0f") cm ")
                    
                }.padding()
                HStack{
                    Text("Weight:")
                    Slider(value: $greutate, in: 1...180).onTapGesture { valoare =  greutate/(((inaltime/100)*(inaltime/100)))
                        if(valoare<18.5){
                            forma = "Subnutrition"
                            poza = "under"
                        }else if((valoare>=18.5)&&(valoare<25)){
                            forma = "Normal"
                            poza = "normal"
                        }else if((valoare  >= 25)&&(valoare  < 30)){
                            forma = "Overweight"
                            poza = "ovrw"
                        }else if((valoare>=30)&&(valoare<35)){
                            forma = "Fat stage 1"
                            poza = "fatst1"
                        }else if ((valoare>=35)&&(valoare<40)){
                            forma = "Fat stage 2"
                            poza = "fatst2"
                        }else if(valoare>=40){
                            forma = "Morbid Obesity"
                            poza = "mfat"
                        }}
                    Text("\(greutate, specifier: "%.0f") kg")
                }.padding()
                HStack{
                    Text("Gender:")
                    Picker(selection: $sex, label: Text("Gender")) {
                        Text("Male").tag(1)
                        Text("Female").tag(2)
                    }
                }
                Spacer()
            }
        }.navigationBarTitle("")
            .navigationBarHidden(true)
    }
}

#Preview {
    Home()
}
