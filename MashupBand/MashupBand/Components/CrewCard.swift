//
//  CrewCard.swift
//  MashupBand
//
//  Created by Capatina Ionut on 06.02.2024.
//

import SwiftUI

struct CrewCard: View {
    @State var crew = ["Sorina","Ionut","Florin","Silviu","Cristi"]
    var body: some View {
        VStack{
            ZStack{
                Image("\(crew[0].lowercased())")
                    .resizable()
                    .scaledToFill()
                HStack(alignment: .bottom){
                    Text("\(crew[0].uppercased())")
                        .font(.title.weight(.bold))
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .fontDesign(.serif)
                        .foregroundStyle(.white)
                }
                .padding(.top, UIScreen.main.bounds.height / 2)
                .padding(.trailing, UIScreen.main.bounds.width / 5)
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    CrewCard()
}
