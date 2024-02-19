//
//  LocateView.swift
//  LocatiiEvenimente
//
//  Created by Capatina Ionut on 14.02.2024.
//

import SwiftUI

struct LocatiiView: View {
    @EnvironmentObject var manager: FirestoreManager
    //@State var numeLocatie:String?
    //@State var orasLocatie:String?
    @State var numeLocatie:String?
    @State var orasLocatie:String?
    @State var numeSala:String?
    @State var capacitateSala:String?
    @State var poza1:String?
    @State var poza2:String?
    @State var poza3:String?
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    ForEach(manager.sirLocatie, id: \.self){ numeLocat in
                        SingleLocationView(numeSal: numeLocat,capacitate: manager.capacitateSala).onAppear() {
                            manager.arataLocatie(numeSala: numeLocat)
                        }
                    }
                }
            }
        }.onAppear(){
            manager.arataLocatii()
        }
    }
}

#Preview {
    LocatiiView()
        .environmentObject(FirestoreManager())
}
