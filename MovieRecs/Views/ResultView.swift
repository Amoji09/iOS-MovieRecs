//
//  ResultView.swift
//  MovieRecs
//
//  Created by Amogh Mantri on 4/19/23.
//

import SwiftUI

struct MovieResultView : View{
  @StateObject var api  = APIModel()
  let movie : TMDBMovie
  @State var cast : [TMDBCast] = []
  var db = Database()
  @ObservedObject var flow = AppFlow.shared
  var body : some View {
    ZStack{
      Color("LoginBackground")
        .ignoresSafeArea()
      
      VStack(alignment: .center, spacing: 10) {
        
        AsyncImage(url:URL(string: "https://image.tmdb.org/t/p/w500/https://image.tmdb.org/t/p/original/\(movie.poster_path ?? "null")")) {phase in
          switch phase{
          case .success(let image):
            image
              .resizable()
              .scaledToFill()
          default:
            Image(systemName: "photo")
          }
        }
        .frame(width:150, height: 200).cornerRadius(5)
        
        RoundedRectangle(cornerRadius: 12).fill(Color("TextFieldBackground")).frame(width:350, height: 100).overlay(Text(movie.title).font(.title2).foregroundColor(Color.white))
        
        ZStack{
          RoundedRectangle(cornerRadius: 12).fill(Color("TextFieldBackground")).frame(width:350, height: 350).overlay(DescriptionView(overview: movie.overview, cast: cast))
          
          
        }
        
        
        HStack {
          Button(action:{flow.user.addMovie(tier: "S", movie: movie)
            db.updateUser()
            flow.objectWillChange.send()
          }){
            RoundedRectangle(cornerRadius: 2)
              .fill(Color(red: 237/255, green: 15/255, blue: 80/255))
              .frame(width: 40, height: 40)
              .overlay(Text("S").foregroundColor(Color.black))
          }
          Button(action:{flow.user.addMovie(tier: "A", movie: movie)
            db.updateUser()
            flow.objectWillChange.send()
          }){
            RoundedRectangle(cornerRadius: 2)
              .fill(Color(red: 203/255, green: 48/255, blue: 96/255))
              .frame(width: 40, height: 40).overlay(Text("A").foregroundColor(Color.black))
          }
          Button(action:{flow.user.addMovie(tier: "B", movie: movie)
            db.updateUser()
            flow.objectWillChange.send()
          }){
            RoundedRectangle(cornerRadius: 2)
              .fill(Color(red: 190/255, green: 49/255, blue: 184/255))
              .frame(width: 40, height: 40)
              .overlay(Text("B").foregroundColor(Color.black))
          }
          Button(action:{flow.user.addMovie(tier: "C", movie: movie)
            db.updateUser()
            flow.objectWillChange.send()
          }){
            RoundedRectangle(cornerRadius: 2)
              .fill( Color(red: 209/255, green: 74/255, blue: 150/255))
              .frame(width: 40, height: 40)
              .overlay(Text("C").foregroundColor(Color.black))
          }
          Button(action:{flow.user.addMovie(tier: "D", movie: movie)
            db.updateUser()
            flow.objectWillChange.send()
          }){
            RoundedRectangle(cornerRadius: 2)
              .fill(Color(red: 223/255, green: 129/255, blue: 51/255))
              .frame(width: 40, height: 40)
              .overlay(Text("D").foregroundColor(Color.black))
          }
          Button(action:{flow.user.addMovie(tier: "F", movie: movie)
            db.updateUser()
            flow.objectWillChange.send()}){
              RoundedRectangle(cornerRadius: 2)
                .fill(Color(red: 244/255, green: 214/255, blue: 47/255))
                .frame(width: 40, height: 40)
                .overlay(Text("F").foregroundColor(Color.black))
            }
        }.padding()
      }
    }.onAppear {
      api.fetchCastCrew(movieId: movie.id, completionHandler:
                          {(cast) in
        self.cast = Array(cast.prefix(5))
      })
    }
  }
}


struct DescriptionView : View  {
  let overview : String
  let cast : [TMDBCast]
  //  let crew : [TMDBCrew]
  
  var body : some View {
    VStack {
      Text("Cast:  \(getCastString())").foregroundColor(Color.white).padding()
      Text(overview).foregroundColor(Color.white).padding()
    }.padding()
  }
  
  func getCastString() -> String {
    var out : String = ""
    for i in 0..<cast.count {
      if(i == cast.count-1){
        out += "\(cast[i].name) "
      } else {
        out += "\(cast[i].name), "
      }
      
    }
    return out
  }
  
}
