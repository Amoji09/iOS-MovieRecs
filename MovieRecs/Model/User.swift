//
//  User.swift
//  MovieTiers
//
//  Created by Viren Mirchandani on 10/27/22.
//

import Foundation


class UserModel {

    
      func addMovie(tier: String, movie: TMDBMovie, user: User) {
        // go into the movies dictionary
        // append TMDBMovie to corresponding value field of dic by tier
        if let user.names[tier] {
            user.names[tier].append(movie)
        }
        
    }
}

struct User : Codable {
    let email: String
    let username: String
    let password: String
    // create a names dictionary
    // String tier is  key
    // Array [TMDBMovie] is value
    var names: [String : [TMDBMovie]]
    
}
