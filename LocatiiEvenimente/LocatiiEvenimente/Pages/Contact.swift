//
//  Contact.swift
//  LocatiiEvenimente
//
//  Created by Capatina Ionut on 13.02.2024.
//

import SwiftUI

struct Contact: View {
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
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Contact")
                        Spacer()
                    }
                    Spacer()
                }
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    Contact()
}
