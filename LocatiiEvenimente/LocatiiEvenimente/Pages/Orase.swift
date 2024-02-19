//
//  Orase.swift
//  LocatiiEvenimente
//
//  Created by Capatina Ionut on 13.02.2024.
//

import SwiftUI

struct Orase: View {
    @EnvironmentObject var manager: FirestoreManager
    var body: some View {
        NavigationStack{
            GeometryReader{ proxy in
                VStack{
                    Menu("Meniu") {
                        NavigationLink{
                            Acasa()
                        }label: {
                            Text("Acasa")
                        }
                        NavigationLink{
                            Locatii()
                        }label: {
                            Text("Locatii")
                        }
                        NavigationLink{
                            Orase().environmentObject(FirestoreManager())
                        }label: {
                            Text("Orase")
                        }
                        NavigationLink{
                            AdaugareLocatie()
                                .environmentObject(FirestoreManager())
                        }label: {
                            Text("Adaugare Locatie")
                        }
                        NavigationLink{
                            Contact()
                        }label: {
                            Text("Contact")
                        }
                    }
                }
                VStack{
                    ScrollView{
                        ForEach(manager.sirOras, id: \.self){ ors in
                            HStack{
                                Spacer()
                                NavigationStack{
                                    NavigationLink{
                                        List{
                                            Text(manager.numeSala)
                                                .font(.title)
                                                .bold()
                                                .onAppear(){
                                                    manager.arataLocatii()
                                                }
                                        }
                                                .onAppear(){
                                                    manager.arataLocatie(oras: ors)
                                                }
                                    }label: {
                                        Section{
                                            Text(ors)
                                                .padding()
                                                .foregroundStyle(.black)
                                        }.padding(5)
                                            .frame(minWidth: 300)
                                            .background(Color.gray.opacity(0.2))
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                    }
                                }
                                Spacer()
                            }
                        }
                    }
                }.onAppear(){
                    manager.arataLocatii()
                }
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    Orase().environmentObject(FirestoreManager())
}
