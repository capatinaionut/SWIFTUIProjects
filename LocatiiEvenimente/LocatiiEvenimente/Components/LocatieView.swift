//
//  LocatieView.swift
//  LocatiiEvenimente
//
//  Created by Capatina Ionut on 13.02.2024.
//

import Firebase
import SwiftUI

struct LocatieView: View {
    @EnvironmentObject var manager: FirestoreManager
    @State var numeLocatie:String?
    @State var orasLocatie:String?
    @State var numeSala:String?
    @State var capacitateSala:String?
    @State var poza1:String?
    @State var poza2:String?
    @State var poza3:String?
    let aspect = 1.5
    var body: some View {
        GeometryReader{proxy in
            VStack{
                HStack{
                    Spacer()
                    Text("\((numeLocatie != nil) ? numeLocatie! : "Hanul Andritei") - \((numeSala != nil) ? numeSala! : "Adagio")")
                        .font(.title)
                    Spacer()
                }
                HStack{
                    Text("Oras: \((orasLocatie != nil) ? orasLocatie! : "Craiova")")
                    Button{
                        print("Locatie \(numeLocatie!), \(orasLocatie!) + \(manager.capacitateSala)")
                    }label: {
                        Image(systemName: "map.circle")
                            .imageScale(.large)
                            .foregroundStyle(.green)
                            .shadow(radius: 15)
                    }
                }
                ScrollView(.horizontal){
                    HStack{
                        /*AsyncImage(url: URL(string: "https://hanulandritei.ro/wp-content/uploads/2023/07/adagio-mio-palazzo-7.jpeg"))*/
                        AsyncImage(
                            url: URL(string: "\((poza1 != nil) ? poza1! : "https://hanulandritei.ro/wp-content/uploads/2023/09/Bellagiox1.jpg")"),
                            transaction: .init(animation: .linear(duration: 3)) // <- slow animation to show issue
                                ) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                            .resizable()
                                            //.frame(width: proxy.size.width / 1.1, height: proxy.size.height / 1.9)
                                            .scaledToFit()
                                            .aspectRatio(aspect, contentMode: .fit)
                                            .clipped()
                                            .cornerRadius(50)
                                            .padding(20)

                                    default:
                                        Image(systemName: "rectangle")
                                            .resizable()
                                            .scaledToFit()
                                            .aspectRatio(aspect, contentMode: .fit)
                                            .clipped()
                                            .foregroundColor(.white)
                                    }
                                }
                                .aspectRatio(aspect, contentMode: .fit)
                        
                        AsyncImage(
                            url: URL(string: "\((poza2 != nil) ? poza2! : "https://hanulandritei.ro/wp-content/uploads/2023/09/Bellagiox1.jpg")"),
                            transaction: .init(animation: .linear(duration: 3)) // <- slow animation to show issue
                                ) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                            .resizable()
                                            //.frame(width: proxy.size.width / 1.1, height: proxy.size.height / 1.9)
                                            .scaledToFit()
                                            .aspectRatio(aspect, contentMode: .fit)
                                            .clipped()
                                            .cornerRadius(50)
                                            .padding(20)

                                    default:
                                        Image(systemName: "rectangle")
                                            .resizable()
                                            .scaledToFit()
                                            .aspectRatio(aspect, contentMode: .fit)
                                            .clipped()
                                            .foregroundColor(.white)
                                    }
                                }
                                .aspectRatio(aspect, contentMode: .fit)
                        
                    }
                }.scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    LocatieView(numeLocatie: "Hanul Andritei ",orasLocatie: "Craiova", numeSala: "Adagio",capacitateSala: "400",poza1: "https://hanulandritei.ro/wp-content/uploads/2023/09/Bellagiox4.jpg",poza2: "https://hanulandritei.ro/wp-content/uploads/2023/09/Bellagiox1.jpg").environmentObject(FirestoreManager())
}
