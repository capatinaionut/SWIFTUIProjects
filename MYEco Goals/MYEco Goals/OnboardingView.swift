//
//  Home1.swift
//  MYEco Goals
//
//  Created by Capatina Ionut on 07.11.2023.
//

import SwiftUI
import CoreMotion

struct OnboardingView: View {
    var body: some View {
        TabView {
                   
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#Preview {
    OnboardingView()
}
