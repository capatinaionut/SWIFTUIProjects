//
//  Acasa.swift
//  LocatiiEvenimente
//
//  Created by Capatina Ionut on 13.02.2024.
//

import SwiftUI

struct Acasa: View {
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
                    }.padding(10)
                        .foregroundStyle(.black)
                        .menuStyle(.automatic)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(5)
                        .toolbarColorScheme(.light, for: .automatic)
                        .preferredColorScheme(.light)
                    
                }
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Acasa")
                        Spacer()
                    }
                    Spacer()
                }
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    Acasa()
}
