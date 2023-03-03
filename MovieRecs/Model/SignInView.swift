//
//  SignInView.swift
//  MovieRecs
//
//  Created by Miguel Jimenez on 2/27/23.
//

import Foundation
import SwiftUI

struct SignInView: View {
  @State var userName: String = ""
  @State var password: String = ""
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
          
          Button{print("sign up")} label:{
            
            Text("LOGIN").frame(width: 300, height: 60).foregroundColor(Color.white).font(.title).background(LinearGradient(gradient: Gradient(colors: [.purple, .red]), startPoint: .leading, endPoint: .trailing).cornerRadius(40)
            )
          }
          
          HStack{
            Text("Don't have an account?").foregroundColor(Color.gray)
            NavigationLink(destination: SignUpView()) {
              Text("SIGN UP").foregroundColor(Color.red)
            }
          }
          
        }
      }
    }
  }
}
struct InputHint: View {
  let text: String
  var body: some View {
    Text("\(text)")
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

