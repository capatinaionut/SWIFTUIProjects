//
//  AdaugareLocatie.swift
//  LocatiiEvenimente
//
//  Created by Capatina Ionut on 13.02.2024.
//

import FirebaseStorage
import SwiftUI

struct AdaugareLocatie: View {
    @EnvironmentObject var manager: FirestoreManager
    @State var numeLocatie = ""
    @State var numeSala = ""
    @State var capacitate = ""
    @State var oras = ""
    @State var poza1 = ""
    @State var poza2 = ""
    @State var poza3 = ""
    @State private var showingAlert = false
    //for image picker
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?
    @State var picName = ""
    
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
                            AdaugareLocatie().environmentObject(FirestoreManager())
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
                        Text("Adaugare locatie")
                        Spacer()
                    }
                    Form{
                        TextField("Nume Sala", text:  $numeSala)
                        TextField("Nume Locatie", text:  $numeLocatie)
                        TextField("Oras", text:  $oras)
                        TextField("Capacitate", text: $capacitate)
                        DisclosureGroup("Poze ?") {
                            DisclosureGroup("Adauga link") {
                                VStack{
                                    TextField("Poza 1: (url)", text: $poza1).textInputAutocapitalization(.never)
                                    TextField("Poza 2: (url)", text: $poza2).textInputAutocapitalization(.never)
                                    TextField("Poza 3: (url)", text: $poza3).textInputAutocapitalization(.never)
                                }
                            }
                                DisclosureGroup("Incara poza") {
                                    VStack{
                                        if selectedImage != nil {
                                            Image(uiImage: selectedImage!)
                                                .resizable()
                                                .frame(width: 200,height: 200)
                                        }
                                        
                                        Button{
                                            isPickerShowing = true
                                        }label: {
                                            Text("Select a Photo")
                                        }
                                        
                                        //Upload button
                                        if selectedImage != nil {
                                            TextField("Image name:", text: $picName)

                                            Button{
                                                //uPLOAD THE IMAGE
                                                uploadPhoto()
                                                poza1 = picName
                                                if(poza1 != picName){
                                                    poza2 = self.picName
                                                }
                                                if(poza2 != poza1){
                                                    poza3 = self.picName
                                                }
                                            }label: {
                                                Text("Upload photo")
                                            }
                                        }
                                    }
                                    .sheet(isPresented: $isPickerShowing, onDismiss: nil){
                                        //Image picker
                                        
                                        ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                                    }
                            }
                        }
                        Button{
                            if((numeLocatie != "")&&(numeSala != "")&&(oras != "")){
                                //manager.adaugaDate()
                                seteazaDate()
                                manager.adaugare()
                                if(manager.statusUpload){
                                    showingAlert.toggle()
                                }
                            }
                        }label: {
                            Text("Incarca locatie!")
                        }.alert("Locatie adaugata cu succes!", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) {
                                numeLocatie = ""
                                numeSala = ""
                                oras = ""
                                capacitate = ""
                                poza1 = ""
                                poza2 = ""
                                poza3 = ""
                            }
                        }
                    }
                    Spacer()
                }
            }
        }.navigationBarBackButtonHidden().environmentObject(FirestoreManager())
    }
    
    func seteazaDate(){
        manager.numeLocatie = numeLocatie
        manager.numeSala = numeSala
        manager.oras = oras
        manager.capacitateSala = capacitate
        manager.poza1 = poza1
        manager.poza2 = poza2
        manager.poza3 = poza3
    }
    
    //func upload image for location
    func uploadPhoto(){
        //make sure the selected image property isn't nil
        guard selectedImage != nil else{
            return
        }
        //create storage reference
        let storageRef = Storage.storage().reference()
        
        //turn our image into data
        let imageData = selectedImage!.jpegData(compressionQuality: 0.8)
        guard imageData != nil else{
            return
        }
        
        //specify the file path and name
        let fileRef = storageRef.child("images/\((picName != "") ? picName : UUID().uuidString).jpg")//with picname
        /*or with autoname
         let fileRef = storageRef.child("images/\(UUID().uuidString).jpg")
         */
        
        //Upload the data
        let uploadTask = fileRef.putData(imageData!, metadata: nil){
            metadata, error in
            
            //check for errors
            if error == nil && metadata != nil{
                
            }
        }
    }
}

#Preview {
    AdaugareLocatie()
        .environmentObject(FirestoreManager())
}
