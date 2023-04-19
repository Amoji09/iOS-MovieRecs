//
//  Database.swift
//  MovieRecs
//
//  Created by Amogh Mantri on 3/7/23.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Database{
  @ObservedObject var flow = AppFlow.shared
  func addUser(userID: String, email: String, password: String, username: String) {
    let db = Firestore.firestore()
    db.collection("Users").document(userID).setData([
      "email": email,
      "username": username,
      "movies": ["S": [], "A": [],"B": [],"C": [],"D": [], "F" : []],
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
    var user = User(email: "failed", username: "failed", movies: ["S": []])
    docRef.getDocument { (document, error) in
      if let document = document, document.exists {
        dataDescription = "\(document.data().map(String.init(describing:)) ?? "nil")"
        let data = document.data()!
        print("DATA: ", data["movies"])
//        print("DATA DESCRIPTION: \(dataDescription)   : END OF DESCRIPTION")
        //                print(data["email"]!)
        user = User(email: data["email"]! as! String, username: data["username"]! as! String, movies: data["movies"]! as! [String : [TMDBMovie]])
        
        //                print("USER OBJECT:   \(user)")
      } else {
        print("Document does not exist")
        
      }
    }
    return user
  }
  
  func getMovies(userID: String){
    let db = Firestore.firestore()
    let docRef = db.collection("Users").document(userID)
    docRef.getDocument (as: User.self) { result in
      switch result {
      case .success(let user):
        print(user.movies)
        flow.user.movies = user.movies
        flow.user.email = user.email
        flow.user.username = user.username
        flow.objectWillChange.send()
      case .failure(let error):
        print("Error: \(error)")
      }
    }
  }
  
  func updateUser() {
    let db = Firestore.firestore()
//    print(flow.user.movies["S"]!)
    do { try db.collection("Users").document(flow.userID).setData(from: flow.user) { err in
      if let err = err {
        print("Error writing document: \(err)")
      } else {
        print("Document successfully written!")
      }
    }
    } catch {
      print("error")
    }
  }
}

