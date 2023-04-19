//
//  LoginView.swift
//  MovieTiers
//
//  Created by Qihui Wang on 10/13/22.
//

import SwiftUI
import Firebase


struct SignInView: View {
  @State var email: String = ""
  @State var password: String = ""
  @State var showErorrMessege = false
    @ObservedObject var flow = AppFlow.shared
  
  
  var body: some View {
    NavigationView{
      ZStack{
        Color("LoginBackground")
          .ignoresSafeArea()
        VStack(alignment: .leading, spacing: 60){
          Text("Sign In").font(.largeTitle).foregroundColor(Color.white).bold()
          VStack(alignment: .leading){
            Text("Email").foregroundColor(Color.white)
              TextField("", text: $email).foregroundColor(Color.white).padding().frame(width: 300, height: 50).background(Color("TextFieldBackground")).cornerRadius(10)
          }
           
          VStack(alignment: .leading){
            Text("Password").foregroundColor(Color.white)
            SecureField("", text: $password).textCase(.lowercase).foregroundColor(Color.white).padding().frame(width: 300, height: 50).background(Color("TextFieldBackground")).cornerRadius(10)
          }
          
          Button(action:{
            login()
          }){
            
            Text("SIGN IN").frame(width: 300, height: 60).foregroundColor(Color.black).font(.title).bold().background(Color(red: 236/255, green: 33/255, blue: 71/255)
            ).cornerRadius(20)
          }
          
          HStack{
            Text("Don't have an account?").foregroundColor(Color.gray)
            Button(action: {
              //if the textfield is empty
              //prints out error messege
              if(self.email == "") {
                showErorrMessege = true
              }
              if(self.password == "") {
                showErorrMessege = true
              }
              flow.hasAccount = false
            }) {
              Text("Sign Up").foregroundColor(Color.red)
            }
          }
          
        }
      }
    }
  }
  func login(){
      print(self.password)
    Auth.auth().signIn(withEmail: self.email, password: self.password) { result, error in
      if error != nil {
        print(error!.localizedDescription)
      }
      else {
          
          print("Sign in result \(result!)")
        flow.loggedIn = true
//          flow.user.username = result?.username ?? "Default"
//        flow.user.email = result?.user.email ?? "Default"
//        flow.user.password = result?.user.password ?? "Default"
          let newUser = result!.user
          let UID:String?
//          UID = Auth.auth().currentUser?.uid
          UID = newUser.uid
          print("sign in uid \(UID!)")
          flow.userID = UID!
          let db = Database(flow:flow)
          db.getMovies(userID: UID!)
//          print("Final movies:  \(flow.user.movies)")
//          print("Final user:  \(flow.user)")
                
          
      }
    }
  }
}

