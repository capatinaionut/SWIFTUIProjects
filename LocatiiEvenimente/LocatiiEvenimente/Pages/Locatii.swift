//
//  Locatii.swift
//  LocatiiEvenimente
//
//  Created by Capatina Ionut on 13.02.2024.
//

import SwiftUI

struct Locatii: View {
    @EnvironmentObject var manager: FirestoreManager
    @AppStorage("inLocation") var inLocation = false
    @State var numeLocatie = ""
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
                        SingleLocationView()
                            .environmentObject(FirestoreManager())
                        Spacer()
                    }
                        .cornerRadius(25)
                    .padding(.top, 10)
                    Spacer()
                }.onAppear(){
                    inLocation = false
                }
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    Locatii()
        .environmentObject(FirestoreManager())
}
