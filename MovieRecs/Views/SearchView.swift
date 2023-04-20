//
//  SearchView.swift
//  MovieRecs
//
//  Created by Amogh Mantri on 4/18/23.
//

import SwiftUI

struct SearchView: View {
  @StateObject var api = APIModel()
  @State var query = ""
  @State var movieTitle = "Default"
  @State var movieResults : [TMDBMovie] = []
  @State var popularMovies : [TMDBMovie] = []
  let popularMovieColumns = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  @ObservedObject var flow = AppFlow.shared
  var body: some View{
    NavigationView{
      ZStack{
        Color("LoginBackground")
          .ignoresSafeArea()
        VStack{
          Spacer()
          
          HStack{
            TextField("Movie Title", text: $query).foregroundColor(Color.white).onSubmit {
              api.fetchFilms(movieName: query, completionHandler: {(films) in
                self.movieResults = films
              })
            }
            Spacer()
            Button(action:{
              if (query.count > 0){
                print("Call api")
                api.fetchFilms(movieName: query, completionHandler: {(films) in
                  self.movieResults = films
                })
              }
            }){
              Image(systemName: "magnifyingglass")
            }
          }.padding().background(Color("TextFieldBackground")).cornerRadius(10).padding()
          
          
          if (self.movieResults.count > 0 && self.query.count > 0) {
            List{
              ForEach(movieResults) { movie in
                NavigationLink(destination: MovieResultView(movie: movie, flow: flow)) {
                  Text(movie.title).foregroundColor(Color.white)
                }.listRowBackground(Color("TextFieldBackground"))
              }
            }.background(Color("LoginBackground")).scrollContentBackground(.hidden)
          } else {
            LazyVGrid(columns: popularMovieColumns, spacing:20) {
              ForEach(popularMovies) { movie in
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
          }
        }
        .onAppear {
          api.fetchPopularFilms(completionHandler:
                                  {(films) in
            self.popularMovies = Array(films.prefix(9))
          })
        }
      }}.ignoresSafeArea(.keyboard)
  }}
