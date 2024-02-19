//
//  ControllerView.swift
//  LocatiiEvenimente
//
//  Created by Capatina Ionut on 14.02.2024.
//

import SwiftUI

struct ControllerView: View {
    @State var pagina:String?
    var body: some View {
        if pagina=="Acasa"{
            Acasa()
        }else if pagina == "Locatii"{
            Locatii()
        }else if pagina == "Orase"{
            Orase()
        }else if pagina == "AdaugareLocatie"{
            AdaugareLocatie()
        }else if pagina == "Contact"{
            Contact()
        }else{
            Acasa()
        }
    }
}

#Preview {
    ControllerView()
}
