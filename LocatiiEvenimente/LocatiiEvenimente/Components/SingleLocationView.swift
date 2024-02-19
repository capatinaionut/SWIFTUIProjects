//
//  SingleLocationView.swift
//  LocatiiEvenimente
//
//  Created by Capatina Ionut on 15.02.2024.
//

import SwiftUI
import Foundation

@Observable
class Location{
    var locatii = [Locatie]()
}
struct SingleLocationView: View{
    @State var numeSal = ""
    @State var capacitate = ""
    //@AppStorage("inLocation") var inLocation = false
    @State private var inLocation = false
    //@GestureState private var zoom = 0.25
    @State private var zoom = 0.15
    @State private var zoomON = false
    //@State private var locatie = Location()
    @EnvironmentObject var manager: FirestoreManager
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
    
    var body: some View {
        NavigationStack{
            //ptr fiecare sala de evenimente arata
            ScrollView{
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(manager.sirLocatie, id: \.self){ numeloc in
                        NavigationLink{
                            withAnimation{
                                VStack{
                                    Text(manager.numeSala)
                                        .font(.title)
                                        .bold()
                                    Text(manager.numeLocatie)
                                        .font(.headline)
                                    Text("Capacitate: \(manager.capacitateSala) persoane")
                                    ScrollView(.horizontal){
                                        HStack{
                                            if(manager.poza1 != ""){
                                                AsyncImage(url: URL(string: manager.poza1)) { image in
                                                    image
                                                        .resizable()
                                                    //.aspectRatio(contentMode: .fit)
                                                        .scaledToFit()
                                                        .cornerRadius(25)
                                                    //.padding()
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                            }
                                            if(manager.poza2 != ""){
                                                AsyncImage(url: URL(string: manager.poza2)) { image in
                                                    image
                                                        .resizable()
                                                    //.aspectRatio(contentMode: .fit)
                                                        .scaledToFit()
                                                        .cornerRadius(25)
                                                    //.padding()
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                            }
                                            if(manager.poza3 != ""){
                                                AsyncImage(url: URL(string: manager.poza3)) { image in
                                                    image
                                                        .resizable()
                                                    //.aspectRatio(contentMode: .fit)
                                                        .scaledToFit()
                                                        .cornerRadius(25)
                                                    //.padding()
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                            }
                                        }.frame(maxWidth: UIScreen.main.bounds.width / 0.25)
                                    }.scrollIndicators(.hidden)
                                }.padding()
                                    .onAppear() {
                                        manager.arataLocatie(numeSala: numeloc)
                                        inLocation = true
                                    }
                            }
                        }label:{
                            VStack{
                                VStack{
                                    Text(numeloc)
                                        .font(.caption.bold())
                                }.frame(width: 120,height: 50)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(15)
                                    .shadow(color: .blue, radius: 40)
                            }.foregroundStyle(.black)
                                .padding(5)
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(45)
                                .shadow(radius: 25)
                                .rotation3DEffect(
                                    .degrees(20),
                                    axis: (x: 0.1, y: 0.0, z: 0.0)
                                )
                                .shadow(radius: 15)
                        }
                    }
                }.onAppear(){
                    if inLocation{
                        //
                    }else{
                        manager.arataLocatii()
                    }
                }
            }.scrollIndicators(.hidden)
        }
    }
}

#Preview {
    SingleLocationView()
        .environmentObject(FirestoreManager())
}
