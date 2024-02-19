//
//  LocationModel.swift
//  LocatiiEvenimente
//
//  Created by Capatina Ionut on 15.02.2024.
//

import Foundation

struct Locatie: Identifiable, Codable{
    var id = UUID()
    var numeSala: String
    var numeLocatie: String
    var oras: String
    var descriereLocatie: String?
    var capacitate: Int 
    
    static var exampleItem = Locatie(numeSala: "Bellagio", numeLocatie: "Hanul Andritei",oras: "Craiova", capacitate: 400)
}
