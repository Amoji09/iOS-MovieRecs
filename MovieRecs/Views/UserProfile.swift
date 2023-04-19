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
  @ObservedObject var flow = AppFlow.shared
  
    var body: some View {
        ZStack{
            Color("LoginBackground")
                .ignoresSafeArea()
            
          VStack{
          ZStack {
            RoundedRectangle(cornerRadius: 10).fill(Color(red:43/255, green:22/255, blue:106/255)).frame(width: 375, height: 250).overlay(
              RoundedRectangle(cornerRadius: 10).fill(Color(red:62/255, green:32/255, blue:155/255)).frame(width: 375, height: 50).overlay(
                HStack{
                  Image(systemName: "person").foregroundColor(Color.white)
                  Text("Account").foregroundColor(Color.white).font(.title3).bold()
                }
              ).shadow(radius: 3, x: 0, y: 5), alignment: .top)}.overlay(
                HStack {
                  Image("buzz")
                   .resizable()
                   .frame(width: 100, height: 100)
                   .clipShape(Circle())
                   .overlay(Circle().stroke(Color.white,lineWidth: 4))
                   .aspectRatio(contentMode: .fit)
                   Spacer()
                  VStack(alignment: .leading){
                    Text("@\(flow.user.username)").foregroundColor(Color.white).bold()
                    Text("\(flow.user.email)").foregroundColor(Color.white).bold()
                  }
                }.padding()
                , alignment: .center).padding(.bottom, 100)
//          }.overlay(
//            HStack{
//              Image("buzz")
//              .resizable()
//              .frame(width: 200, height: 200)
//              .clipShape(Circle())
//              .overlay(Circle().stroke(Color.white,lineWidth: 4))
//              .shadow(color: .white, radius: 7)
//              .aspectRatio(contentMode: .fit)
//              VStack {
//                Text(flow.user.username).foregroundColor(Color.white).font(.title2).bold()
//              }
//            }, )
//            VStack(alignment: .center, spacing: 20){
//                Text("USER PROFILE")
//                    .padding(10)
//                    .fontWeight(.heavy)
//                    .font(.largeTitle)
//                    .foregroundColor(.white)
//                    .padding(.vertical, 30)
//
//                Image("buzz")
//                    .resizable()
//                    .frame(width: 200, height: 200)
//                    .clipShape(Circle())
//                    .overlay(Circle().stroke(Color.white,lineWidth: 4))
//                    .shadow(color: .white, radius: 7)
//                    .aspectRatio(contentMode: .fit)
//
//              HStack{
//
//                Text("Username:").padding(5)
//                  .font(.title2).foregroundColor(Color.white)
//                Spacer()
//                Text(flow.user.username).padding(5)
//                  .font(.title2).foregroundColor(Color.white)
//              }.padding()
//
//              HStack{
//                Text("Email:").font(.title2).foregroundColor(Color.white)
//                Spacer()
//                Text(flow.user.email).font(.title2).foregroundColor(Color.white)
//              }.padding()
//
//
                

                Button {
                  flow.loggedIn = false
                } label: {
                    Text("Sign Out")
                    .font(.title).bold()
                    .foregroundColor(Color.black)
                        .padding(10)
                        .background(Color(red: 236/255, green: 33/255, blue: 71/255)).cornerRadius(10)

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
