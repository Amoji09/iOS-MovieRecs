//
//  DataBaseView.swift
//  MovieRecs
//
//  Created by Amogh Mantri on 3/7/23.
//
//
//import SwiftUI
//
//struct DataBaseView: View {
//  @ObservedObject var db = Database()
//  @State var email : String = ""
//  @State var username : String = ""
//  @State var password : String = ""
//  @State var movies: [String:[TMDBMovie]]
//  var body: some View {
//    VStack{
//      TextField("Email", text: $email)
//      TextField("User", text: $username)
//      TextField("Password", text: $password)
//      Button(action: {
//          let user = User(email: email, username: username, password: password, movies: [])
//          db.addUser(userID: username, email: email)
//      } ) {
//        Text("Add city")
//      }
//      Button(action: {
//        db.getUser(docName: docName)
//      } ) {
//        Text("Get city")
//      }
//      Text(db.getCityOut)
//    }
//  }
//}
//
//struct DataBaseView_Previews: PreviewProvider {
//    static var previews: some View {
//        DataBaseView()
//    }
//}
