//
//  User.swift
//  MovieTiers
//
//  Created by Viren Mirchandani on 10/27/22.
//

import Foundation

class User {
    
    let email: String
    let username: String
    let password: String
    let movies: [Movie]
  
  
  
    
    init (email: String, username: String, password: String, movies: [Movie]) {
        self.email = email
        self.username = username
        self.password = password
        self.movies = movies
    }
}
