//
//  ContentView.swift
//  MYH Fitness&Health
//
//  Created by Capatina Ionut on 05.11.2023.
//

import SwiftUI
import Foundation

struct ContentView: View {
  @State var countHomeBtn:Bool = false
    
    var body: some View {  
        NavigationView {
            VStack{
                if(countHomeBtn == false){
                     StartView()
                }else{
                    Home()
                    
                }
            }
        }.navigationBarTitle("")
            .navigationBarHidden(true)
    }
}

#Preview {
    ContentView()
}
