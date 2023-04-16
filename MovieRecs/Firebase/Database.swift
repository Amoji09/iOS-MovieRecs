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
    @Published var getUserOut = ""
    func addUser(userID: String, email: String, password: String, username: String) {
        let db = Firestore.firestore()
        db.collection("Users").document(userID).setData([
            "email": email,
            "username": username,
            "movies": ["S": [], "A": [],"B": [],"C": [],"D": []],
            "password": password
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
    }
    
    func getUser(userID: String) -> User {
        let db = Firestore.firestore()
        let docRef = db.collection("Users").document(userID)
        var dataDescription  = "error"
        var user = User(email: "failed", username: "failed", password: "failed", movies: ["S": []])
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                dataDescription = "\(document.data().map(String.init(describing:)) ?? "nil")"
                var data = document.data()!
                print(data)
                print("Document data: \(dataDescription)")
                print(data["email"]!)
                user = User(email: data["email"]! as! String, username: data["username"]! as! String, password: data["password"]! as! String, movies: data["movies"]! as! [String : [TMDBMovie]])

                
            } else {
                print("Document does not exist")

            }
        }
        return user
    }
    
}

