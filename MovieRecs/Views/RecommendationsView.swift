//
//  RecommendationsView.swift
//  MovieRecs
//
//  Created by Amogh Mantri on 4/19/23.
//

import SwiftUI

struct RecommendationsView: View {
  @ObservedObject var flow  = AppFlow.shared
  @State var recommendations : [TMDBMovie] = []
  let popularMovieColumns = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  var api = APIModel()
  var body: some View {
    VStack{
      Text("Recommended For You").foregroundColor(Color.white).font(.title).bold()
    ScrollView{
    LazyVGrid(columns: popularMovieColumns, spacing:20) {
      ForEach(recommendations) { movie in
        NavigationLink(destination: MovieResultView(movie: movie, flow: flow)) {
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
          .frame(width:100, height: 175).cornerRadius(5)
        }
      }
      }
    }.onAppear(perform:{
      api.fetchRecs(movies: flow.user.movies, completionHandler: { (films) in
        recommendations = films
        
      })
    })
  }
  }
  
}

struct RecommendationsView_Previews: PreviewProvider {
  static var previews: some View {
    RecommendationsView()
  }
}
