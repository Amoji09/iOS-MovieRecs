//
//  UserProfileView.swift
//  MovieRecs
//
//  Created by Jake Kotzian on 3/1/23.
//

import SwiftUI

struct UserProfileView: View {
    let userName: String = "ranawoods1997"
    let email: String = "ranawoods@gatech.edu"
    let name: String = "Rana Woods"
    var body: some View {
        NavigationView{
            ZStack {
               Color("LoginBackground")
            .ignoresSafeArea()
                VStack(spacing: 30){
                    HStack(alignment:.center){
                        Image("UserFace")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 100, height: 100).padding()
                        
                        Text(name).font(.largeTitle).foregroundColor(Color.white).padding()
                        Spacer()
                    }
                    VStack(alignment: .leading){
                        Text("User Name:").foregroundColor(Color.white).underline().bold()
                        Text(userName).foregroundColor(Color.white).padding().frame(width: 300, height: 50, alignment:.leading).background(Color("TextFieldBackground")).cornerRadius(10)
                    }
                    VStack(alignment: .leading){
                        Text("Email:").foregroundColor(Color.white).underline().bold()
                        Text(email).foregroundColor(Color.white).padding().frame(width: 300, height: 50, alignment: .leading).background(Color("TextFieldBackground")).cornerRadius(10)
                        Spacer()
                    }
                    
                    VStack(alignment:.leading) {
                        Text("Most Watched Movie:").foregroundColor(Color.white).bold().padding().underline().bold()
                    }
                
                    
                    HStack{
                        Image("RoG").resizable().frame(width: 200, height: 250)
                    }
                    
                
                    HStack{
                        HStack(){
                            NavigationLink(destination: SignUpView()) {
                                Text("SIGN OUT").font(.system(size: 25)).foregroundColor(Color.red).padding()
                            }
                        }
                    }
                
                }
            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
