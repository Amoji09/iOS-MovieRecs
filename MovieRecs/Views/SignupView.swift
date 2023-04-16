//
//  SignupView.swift
//  MovieRecs
//
//  Created by Steve  on 2/28/23.
//

import Foundation
import SwiftUI
import Firebase

struct SignUpView: View {
  @State var userName: String = ""
  @State var password: String = ""
  @State var email: String = ""
    @ObservedObject var flow : AppFlow
  
  var body: some View {
    NavigationView{
      ZStack{
        Color("LoginBackground")
          .ignoresSafeArea()
        VStack(alignment: .leading, spacing: 60){
          Text("Create Account").font(.largeTitle).foregroundColor(Color.white)
          VStack(alignment: .leading){
            Text("Username").foregroundColor(Color.white)
            TextField("Your Username", text: $userName).foregroundColor(Color.white).padding().frame(width: 300, height: 50).background(Color("TextFieldBackground")).cornerRadius(10)
          }
          
          VStack(alignment: .leading){
            Text("Email").foregroundColor(Color.white)
            TextField("", text: $email).foregroundColor(Color.white).padding().frame(width: 300, height: 50).background(Color("TextFieldBackground")).cornerRadius(10)
          }
          
          VStack(alignment: .leading){
            Text("Password").foregroundColor(Color.white)
            SecureField("", text: $password).foregroundColor(Color.white).padding().frame(width: 300, height: 50).background(Color("TextFieldBackground")).cornerRadius(10)
          }
          
          
          Button(action:{
            
            flow.loggedIn = register()})
          {
            
            Text("SIGN UP").frame(width: 300, height: 60).foregroundColor(Color.white).font(.title).background(LinearGradient(gradient: Gradient(colors: [.purple, .red]), startPoint: .leading, endPoint: .trailing).cornerRadius(40)
            )
          }
          
          HStack{
            Text("Already have an account?").foregroundColor(Color.gray)
            Button(action: {
              flow.hasAccount = true
            }) {
              Text("SIGN IN").foregroundColor(Color.red)
            }
          }
          
        }
      }
    }
  }
  func register() -> Bool{
    var successfulRegistration = true
    Auth.auth().createUser(withEmail: self.email, password: self.password) { result, error in
      if error != nil {
        successfulRegistration = false
        print(error!.localizedDescription)
      } else {
          var db = Database(flow: flow)
          db.addUser(userID: result?.user.uid ?? "error", email: self.email, password: self.password, username: self.userName)
          let UID:String?
          UID = Auth.auth().currentUser?.uid
          print(db.getUser(userID:UID ?? "none"))
          flow.user = User(email: self.email, username: self.userName, password: self.password, movies: [:])
          print("User info \(flow.user)")
//          flow.user = currUser
//          print(flow.user)
      }
      
    }
    return successfulRegistration
  }
}



public struct PlaceholderStyle: ViewModifier {
  var showPlaceHolder: Bool
  var placeholder: String
  
  public func body(content: Content) -> some View {
    ZStack(alignment: .leading) {
      if showPlaceHolder {
        Text(placeholder)
          .padding(.horizontal, 15)
      }
      content
        .foregroundColor(Color.red)
        .padding(5.0)
    }
  }
}


struct InputHint: View {
  let text: String
  var body: some View {
    Text("\(text)")
  }
}
