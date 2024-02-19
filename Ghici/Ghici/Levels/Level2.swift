//
//  Level2.swift
//  Ghici
//
//  Created by Capatina Ionut on 19.02.2024.
//

import SwiftUI

struct Level2: View {
    @AppStorage("level") var level = 1
    @State var count = 5
    @AppStorage("life") var life = 3
    @State var mesaj = ""
    @State var symbol = ["","","","","","","","",""]
    @AppStorage("score") var score = 0
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Spacer()
                    Text("Life: ")
                    HStack{
                        ForEach(0..<life, id: \.self){ lf in
                            Image(systemName: "heart.fill")
                                .scaledToFit()
                                .foregroundStyle(.red)
                        }
                    }
                    Spacer()
                    Text("Score: \(score)")
                    Spacer()
                }
                Text("Level: \(level)")
                Spacer()
                Text("Guess the pattern")
                    .bold()
                    .font(.title)
                Text("Tap ang guess the pattern")
                HStack{
                    Text("Remaining tap: \(count)")
                        .bold()
                }
            }
            HStack{
                Text("\(symbol[0])")
                    .padding(20)
                    .background((symbol[0] == "0") ? Color.green.opacity(0.7) :  Color.gray.opacity(0.2))
                    .foregroundStyle(.white)
                    .font(.title)
                    .onTapGesture {
                        withAnimation(.bouncy){
                            if(count >= 0){
                                count -= 1
                                symbol[0] = "0"
                                score += 1
                            }
                        }
                    }.padding()
                Text("\(symbol[1])")
                    .padding(20)
                    .background((symbol[1] == "X") ? Color.red.opacity(0.7) :  Color.gray.opacity(0.2))
                    .foregroundStyle(.white)
                    .font(.title)
                    .onTapGesture {
                        withAnimation(.bouncy){
                            if(count >= 0){
                                count -= 1
                                symbol[1] = "X"
                            }
                        }
                    }
                    .padding()
                Text("\(symbol[2])")
                    .padding(20)
                    .background((symbol[2] == "0") ? Color.green.opacity(0.7) :  Color.gray.opacity(0.2))
                    .foregroundStyle(.white)
                    .font(.title)
                    .onTapGesture {
                        withAnimation(.bouncy){
                            if(count >= 0){
                                count -= 1
                                symbol[2] = "0"
                                score += 1
                            }
                        }
                    }.padding()
            }
            HStack{
                Text("\(symbol[3])")
                    .padding(20)
                    .background((symbol[3] == "X") ? Color.red.opacity(0.7) :  Color.gray.opacity(0.2))
                    .foregroundStyle(.white)
                    .font(.title)
                    .onTapGesture {
                        withAnimation(.bouncy){
                            if(count >= 0){
                                count -= 1
                                symbol[3] = "X"
                            }
                        }
                    }.padding()
                Text("\(symbol[4])")
                    .padding(20)
                    .background((symbol[4] == "0") ? Color.green.opacity(0.7) :  Color.gray.opacity(0.2))
                    .foregroundStyle(.white)
                    .font(.title)
                    .onTapGesture {
                        withAnimation(.bouncy){
                            if(count >= 0){
                                count -= 1
                                symbol[4] = "0"
                                score += 1
                            }
                        }
                    }.padding()
                Text("\(symbol[5])")
                    .padding(20)
                    .background((symbol[5] == "X") ? Color.red.opacity(0.7) :  Color.gray.opacity(0.2))
                    .foregroundStyle(.white)
                    .font(.title)
                    .onTapGesture {
                        withAnimation(.bouncy){
                            if(count >= 0){
                                count -= 1
                                symbol[5] = "X"
                            }
                        }
                    }.padding()
            }
            HStack{
                Text("\(symbol[6])")
                    .padding(20)
                    .background((symbol[6] == "X") ? Color.red.opacity(0.7) :  Color.gray.opacity(0.2))
                    .foregroundStyle(.white)
                    .font(.title)
                    .onTapGesture {
                        withAnimation(.bouncy){
                            if(count >= 0){
                                count -= 1
                                symbol[6] = "X"
                            }
                        }
                    }.padding()
                Text("\(symbol[7])")
                    .padding(20)
                    .background((symbol[7] == "X") ? Color.red.opacity(0.7) :  Color.gray.opacity(0.2))
                    .foregroundStyle(.white)
                    .font(.title)
                    .onTapGesture {
                        withAnimation(.bouncy){
                            if(count >= 0){
                                count -= 1
                                symbol[7] = "X"
                            }
                        }
                    }.padding()
                Text("\(symbol[8])")
                    .padding(20)
                    .background((symbol[8] == "X") ? Color.red.opacity(0.7) :  Color.gray.opacity(0.2))
                    .foregroundStyle(.white)
                    .font(.title)
                    .onTapGesture {
                        withAnimation(.bouncy){
                            if(count >= 0){
                                count -= 1
                                symbol[8] = "X"
                            }
                        }
                    }.padding()
                
            }
            VStack{
                Text("\(mesaj)")
                    .foregroundStyle((mesaj=="GAME OVER") ? .red : .black)
                    .onChange(of: count){
                        if(symbol[0]=="0")&&(symbol[2]=="0")&&(symbol[4]=="0"){
                            mesaj = "Well done!"
                        }else{
                            if(count <= 0){
                                mesaj = "Try again"
                                count = 0
                                if(life > 1){
                                    life -= 1
                                    if(score >= 6){
                                        score -= 3
                                    }else{
                                        score = 3
                                    }
                                    symbol = ["","","","","","","","",""]
                                }else{
                                    mesaj = "GAME OVER"
                                }
                            }
                        }
                    }
                if(count <= 0)&&(mesaj != "Well done!"){
                    Button{
                        if((life <= 1)&&(mesaj == "GAME OVER")){
                            life = 3
                            symbol = ["","","","","","","","",""]
                            count = 5
                            mesaj = ""
                            if(level>1){
                                level = 1
                                score = 0
                            }
                        }else{
                            symbol = ["","","","","","","","",""]
                            count = 5
                            mesaj = ""
                        }
                    }label: {
                        Text("Reset")
                    }
                }else if(mesaj == "Well done!"){
                    Button{
                        level = 3
                        count = 5
                    }label:{
                        Text("Level 3")
                            .bold()
                            .padding()
                            .background(Color.green.opacity(0.4))
                            .cornerRadius(30)
                    }
                }
                Spacer()
            }
        }.preferredColorScheme(.light)
    }
}

#Preview {
    Level2()
}
