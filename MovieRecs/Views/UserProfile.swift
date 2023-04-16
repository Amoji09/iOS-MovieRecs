//
//  UserProfile.swift
//  MovieRecs
//
//  Created by Rhea Garg on 2/28/23.
//

import SwiftUI

struct UserProfile: View {
    @State var name: String = ""
    @State var username: String = ""
    @State var email: String = ""
  @ObservedObject var flow : AppFlow
  
    var body: some View {
        ZStack{
            Color("LoginBackground")
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 20){
                Text("USER PROFILE")
                    .padding(10)
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.vertical, 30)
                
                Image("buzz")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white,lineWidth: 4))
                    .shadow(color: .white, radius: 7)
                    .aspectRatio(contentMode: .fit)
                    
              HStack{

                Text("Username:").padding(5)
                  .font(.title2).foregroundColor(Color.white)
                Spacer()
                Text(flow.user.username).padding(5)
                  .font(.title2).foregroundColor(Color.white)
              }.padding()
              
              HStack{
                Text("Email:").font(.title2).foregroundColor(Color.white)
                Spacer()
                Text(flow.user.email).font(.title2).foregroundColor(Color.white)
              }.padding(.bottom, -10)
                
                
                Spacer()
                
                Button {
                  flow.loggedIn = false
                } label: {
                    Text("Log Out")
                        .padding(10)
                        .background(LinearGradient(gradient: Gradient(colors: [.purple, .red]), startPoint: .leading, endPoint: .trailing).cornerRadius(10))
                        .font(.title)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 20)
                        
                        
                }
            }
        }
    }
    
    struct UserProfile_Previews: PreviewProvider {
        static var previews: some View {
          UserProfile(flow : AppFlow())
        }
    }
}
