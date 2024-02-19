//
//  CrewPage.swift
//  MashupBand
//
//  Created by Capatina Ionut on 06.02.2024.
//

import SwiftUI

struct CrewPage: View {
    @State var crew = ["Sorina","Ionut","Florin","Silviu","Cristi"]
    @State var anim1 = 1.0
    @State var anim2 = false
    var body: some View {
        HStack{
            VStack(alignment: .center){
            Text("TRUPA")
                    .font(.title2).foregroundStyle(.conicGradient(colors: [.red,.orange,.black,.red], center: .bottom))
                    .fontWeight(.bold)
                    .fontDesign(.serif)
                    .rotationEffect(.degrees(anim2 ? 90: 0))
                    .shadow(color: .orange, radius: 20)
            }.frame(width: anim2 ? 80 : 0)
                .frame(height: 200)
            VStack{
                ScrollView(.vertical){
                    ForEach(crew, id: \.self){ crw in
                        withAnimation(.easeInOut){
                            CrewCard(crew: [crw]).cornerRadius(45)
                                .shadow(color: anim2 ? .orange.opacity(0.9) : .black, radius: 17)
                                .scaleEffect(anim2 ? 1.02 : anim1)
                                .rotation3DEffect(.degrees(anim2 ? 180 : 0),
                                                          axis: (x: 0.0, y: 1.0, z: 0.25)
                                )
                        }
                    }
                }.transition(.move(edge: .bottom))
                    .ignoresSafeArea()
                    .scrollIndicators(.hidden)
                    .onTapGesture {
                        withAnimation{
                            //anim1 = 1.03
                            anim2.toggle()
                        }
                    }
            }
        }.ignoresSafeArea()
            .padding(-10)
    }
}

#Preview {
    CrewPage()
}
