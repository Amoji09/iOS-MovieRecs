//
//  AppFlow.swift
//  MovieRecs
//
//  Created by Steve  on 2/28/23.
//

import Foundation
import SwiftUI

class AppFlow: ObservableObject {
  static let shared = AppFlow()
  @Published var loggedIn : Bool = false
    @Published var hasAccount : Bool = true
    @Published var user = User(email: "default", username: "default", movies: ["S":[TMDBMovie](),"A":[TMDBMovie](),"B":[TMDBMovie](),"C":[TMDBMovie](),"D":[TMDBMovie](),"F":[TMDBMovie]()])
    @Published var userID = ""
  
    func getMovies(tier: String) -> [TMDBMovie] {
      return user.movies[tier] ?? []
    }
    func setMovies(movies: [String:[TMDBMovie]]) {
        self.user.movies = movies
    }
  
}
