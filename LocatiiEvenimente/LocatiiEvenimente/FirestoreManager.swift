//
//  FirestoreManager.swift
//  LocatiiEvenimente
//
//  Created by Capatina Ionut on 14.02.2024.
//

import Foundation
import FirebaseFirestore


class FirestoreManager: ObservableObject {
    @Published public var numeSala:String = ""
    @Published var sirLocatie:[String]=[]
    @Published var sirOras:[String]=[]
    @Published var capacitateSala:String = ""
    @Published public var numeLocatie:String = ""
    @Published public var oras:String = ""
    @Published public var poza1:String = ""
    @Published public var poza2:String = ""
    @Published public var poza3:String = ""
    @Published public var statusUpload:Bool = false
    var locatie: [Locatie] = []
    public var db = Firestore.firestore()
    
    //Retrieve all location
    func arataLocatii() {
            db.collection("locate").getDocuments { [self] (snapshot, error) in
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    self.numeSala = document.data()["numeSala"] as? String ?? ""
                    self.numeLocatie = document.data()["numeLocatie"] as? String ?? ""
                    self.capacitateSala = document.data()["capacitate"] as? String ?? ""
                    self.oras = document.data()["oras"] as? String ?? ""
                    self.poza1 = document.data()["poza1"] as? String ?? ""
                    self.poza2 = document.data()["poza2"] as? String ?? ""
                    self.poza3 = document.data()["poza3"] as? String ?? ""
                    sirLocatie.append(numeSala)
                    if(sirOras.contains(oras)){
                    }else{
                        sirOras.append(oras)
                    }
                    
                }
            }
        }
    }
    
    //retrive locatie where numeSala = numeSala
    func arataLocatie(numeSala: String) {
        db.collection("locate").whereField("numeSala", isEqualTo: numeSala)
            .getDocuments(){ [self](snapshot, error) in
                if let snapshot = snapshot{
                    for document in snapshot.documents {
                        self.numeSala = document.data()["numeSala"] as? String ?? ""
                        self.numeLocatie = document.data()["numeLocatie"] as? String ?? ""
                        self.capacitateSala = document.data()["capacitate"] as? String ?? ""
                        self.oras = document.data()["oras"] as? String ?? ""
                        self.poza1 = document.data()["poza1"] as? String ?? ""
                        self.poza2 = document.data()["poza2"] as? String ?? ""
                        self.poza3 = document.data()["poza3"] as? String ?? ""
                        adaugaDate()
                        print(capacitateSala)
                        print(numeSala)
                        //print("\(document.documentID) => \(document.data())")
                    }
                }
            }
    }
    
    func arataLocatie(oras: String) {
        db.collection("locate").whereField("oras", isEqualTo: oras)
            .getDocuments(){ [self](snapshot, error) in
                if let snapshot = snapshot{
                    for document in snapshot.documents {
                        self.numeSala = document.data()["numeSala"] as? String ?? ""
                        self.numeLocatie = document.data()["numeLocatie"] as? String ?? ""
                        self.capacitateSala = document.data()["capacitate"] as? String ?? ""
                        self.oras = document.data()["oras"] as? String ?? ""
                        self.poza1 = document.data()["poza1"] as? String ?? ""
                        self.poza2 = document.data()["poza2"] as? String ?? ""
                        self.poza3 = document.data()["poza3"] as? String ?? ""
                        sirLocatie.append(numeSala)
                        adaugaDate()
                        print(capacitateSala)
                        print(numeSala)
                        //print("\(document.documentID) => \(document.data())")
                    }
                }
            }
    }
    
    func adaugaDate(){
        numeSala = self.numeSala
        numeLocatie = self.numeLocatie
        capacitateSala = self.capacitateSala
        oras = self.oras
        poza1 = self.poza1
        poza2 = self.poza2
    }
    
    func adaugare(){
        //adaugaDate()
        //let db = Firestore.firestore()
        // Add a new document with a generated ID
  let ref = db.collection("locate").addDocument(data: [
                    "numeSala": numeSala,
                    "numeLocatie": numeLocatie,
                    "oras": oras,
                    "capacitate": capacitateSala,
                    "poza1": poza1,
                    "poza2": poza2,
                    "poza3": poza3]
                    )
                print("Document added with ID: \(ref.documentID)")
                statusUpload = true
                
    }
}
