//
//  HomeLogo.swift
//  MYH Fitness&Health
//
//  Created by Capatina Ionut on 05.11.2023.
//

import SwiftUI

struct HomeLogo: View {
    var body: some View {
        VStack {
            Image("logo_calc").resizable()
                .scaledToFill()
        }
    }
}

#Preview {
    HomeLogo()
}
