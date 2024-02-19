//
//  ContentView.swift
//  Ghici
//
//  Created by Capatina Ionut on 18.02.2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("level") var level = 1
    @State var count = 5
    @AppStorage("life") var life = 3
    @State var symbol = ["","","","","","","","",""]
    @State var symbolverif = ["","","","","","","","",""]
    @State var symbolcorect = ["X","0","X","X","0","X","X","0","X"]
    @State var mesaj = ""
    var body: some View {
        switch level {
        case 1:
            Level1()
        case 2:
            Level2()
        case 3:
            Level3()
        case 4:
            Level4()
        case 5:
            Level5()
        case 6:
            Level6()
        case 7:
            Level7()
        case 8:
            Level8()
        default:
            Level1()
        }
    }
}

#Preview {
    ContentView()
}
