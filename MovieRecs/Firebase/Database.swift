//
//  Database.swift
//  MovieRecs
//
//  Created by Amogh Mantri on 3/7/23.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

class Database : ObservableObject {
  @Published var getCityOut = ""
  func addCity(docName: String, city: City) {
    let db = Firestore.firestore()
    db.collection("cities").document(docName).setData([
      "name": city.name,
      "state": city.state,
      "country": city.country,
    ]) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
    }

  }
  
  func getCity(docName: String ){
    let db = Firestore.firestore()
    let docRef = db.collection("cities").document(docName)
    var dataDescription  = "error"
    docRef.getDocument { (document, error) in
        if let document = document, document.exists {
            dataDescription = "\(document.data().map(String.init(describing:)) ?? "nil")"
            print("Document data: \(dataDescription)")
            self.getCityOut = dataDescription
        } else {
            print("Document does not exist")
        }
    }
  }
  
}


struct City {
  let name : String
  let state : String
  let country : String
}
