//
//  LoginView.swift
//  MovieTiers
//
//  Created by Qihui Wang on 10/13/22.
//

import SwiftUI


struct SignInView: View {
  @State var userName: String = ""
  @State var password: String = ""
    @State var showErorrMessege = false
  @ObservedObject var flow = AppFlow()
    
  var body: some View {
    NavigationView{
      ZStack{
        Color("LoginBackground")
          .ignoresSafeArea()
        VStack(alignment: .leading, spacing: 60){
          Text("Login").font(.largeTitle).foregroundColor(Color.white)
          VStack(alignment: .leading){
            Text("Username").foregroundColor(Color.white)
            TextField("Your Username", text: $userName).foregroundColor(Color.white).padding().frame(width: 300, height: 50).background(Color("TextFieldBackground")).cornerRadius(10)
          }
          
          VStack(alignment: .leading){
            Text("Password").foregroundColor(Color.white)
            TextField("", text: $password).foregroundColor(Color.white).padding().frame(width: 300, height: 50).background(Color("TextFieldBackground")).cornerRadius(10)
          }
          
          Button{flow.loggedIn = true} label:{
            
            Text("LOGIN").frame(width: 300, height: 60).foregroundColor(Color.white).font(.title).background(LinearGradient(gradient: Gradient(colors: [.purple, .red]), startPoint: .leading, endPoint: .trailing).cornerRadius(40)
            )
          }
          
          HStack{
            Text("Don't have an account?").foregroundColor(Color.gray)
              Button(action: {
                  //if the textfield is empty
                  //prints out error messege
                  if(self.userName == "") {
                      showErorrMessege = true
                  }
                  if(self.password == "") {
                      showErorrMessege = true
                  }
                  flow.hasAccount = false 
              }) {
              Text("SIGN UP").foregroundColor(Color.red)
            }
          }
          
        }
      }
    }
  }
}

