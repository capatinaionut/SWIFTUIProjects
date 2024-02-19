//
//  StartView.swift
//  MYH Fitness&Health
//
//  Created by Capatina Ionut on 05.11.2023.
//

import SwiftUI
import Foundation

struct StartView: View {
    @State private var countHomeBtn:Bool = false
    var body: some View {
        NavigationView{
            VStack {
                HomeLogo()
                NavigationLink(destination: Home()) {
                    
                    Label("", image: "home_btn1")               }
                .onAppear(perform: {
                    countHomeBtn = true
                })
            }.padding()
        }.navigationBarTitle("")
            .navigationBarHidden(true)
    }
}

#Preview {
    StartView()
}
