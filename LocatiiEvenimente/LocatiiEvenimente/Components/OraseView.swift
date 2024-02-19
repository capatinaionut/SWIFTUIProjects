//
//  OraseView.swift
//  LocatiiEvenimente
//
//  Created by Capatina Ionut on 13.02.2024.
//

import SwiftUI

struct OraseView: View {
    @EnvironmentObject var manager: FirestoreManager
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Text("SALUIT")
                }
            }
        }
    }
}

#Preview {
    OraseView()
}
