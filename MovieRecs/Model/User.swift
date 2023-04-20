//
//  User.swift
//  MovieTiers
//
//  Created by Viren Mirchandani on 10/27/22.
//

import Foundation

class User : Codable{
  
  var email: String
  var username: String
  var movies: [String:[TMDBMovie]]
  
  
  
  func addMovie(tier: String, movie: TMDBMovie) {
    // go into the movies dictionary
    // append TMDBMovie to corresponding value field of dic by tier
    //      print(tier)
    //      print(movie)
    //      print(movies
    let tiers = ["S","A","B","C","D","F"]
    for tier in tiers{
      if let index = movies[tier]!.firstIndex(of: movie) {
        movies[tier]!.remove(at: index)
        print("\(movie) removed from the array!")
        break
      } else {
        print("\(movie) not found in the array.")
      }
    }
    if movies[tier] == nil{
      movies[tier] = []
      movies[tier]!.append(movie)
    }
    else{
      movies[tier]!.append(movie)
    }
  }
  
  func removeMovie(movie: TMDBMovie) {
    // go into the movies dictionary
    // append TMDBMovie to corresponding value field of dic by tier
    //      print(tier)
    //      print(movie)
    //      print(movies
    let tiers = ["S","A","B","C","D","F"]
    for tier in tiers{
      if let index = movies[tier]!.firstIndex(of: movie) {
        movies[tier]!.remove(at: index)
        print("\(movie) removed from the array!")
        break
      } else {
        print("\(movie) not found in the array.")
      }
    }
  }
  
  
  init (email: String, username: String, movies: [String:[TMDBMovie]]) {
    self.email = email
    self.username = username
    self.movies = movies
  }
}
