//
//  User.swift
//  MovieTiers
//
//  Created by Viren Mirchandani on 10/27/22.
//

import Foundation

class User :Codable{
    
    var email: String
    var username: String
    var password: String
    var movies: [String:[TMDBMovie]]
  
    func addMovie(tier: String, movie: TMDBMovie) {
          // go into the movies dictionary
          // append TMDBMovie to corresponding value field of dic by tier
      print(tier)
      print(movie)
      movies[tier]!.append(movie)
      print(movies)
      }
  
    
  init (email: String, username: String, password: String, movies: [String:[TMDBMovie]]) {
        self.email = email
        self.username = username
        self.password = password
        self.movies = movies
    }
}
