//
//  ContentView.swift
//  MYEco Goals
//
//  Created by Capatina Ionut on 07.11.2023.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    var body: some View {
        NavigationView{
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                ZStack {
                    Image("back1").resizable()
                        .padding(.vertical, -100.0)
                        .scaledToFill()
                    //.foregroundStyle(.tint)
                    VStack{
                        Text("'You make the diference!'")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(.black)
                    }
                }.scaledToFill().tabItem { Label("Walk, don't drive", systemImage: "figure.walk") }.tag(1)
                Text("Tab Content 2").tabItem { Text("Recicle") }.tag(2)
                Text("Tab Content 3").tabItem { Text("Recicle1") }.tag(3)
            }
        }.navigationBarTitle("")
            .navigationBarHidden(true)
    }
}

#Preview {
    ContentView()
}
