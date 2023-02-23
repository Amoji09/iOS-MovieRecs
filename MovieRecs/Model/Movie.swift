//
//  MovieType.swift
//  MovieTiers
//
//  Created by Viren Mirchandani on 10/27/22.
//

import Foundation

class Movie {
    
    let id: String
    let name: String
    let actors: [String]
    let genres: [String]
    let director: String
    let criticRating: Int
    
    init (id: String, name: String, actors: [String], genres: [String], director: String, criticRating: Int ) {
        self.id = id
        self.name = name
        self.actors = actors
        self.genres = genres
        self.director = director
        self.criticRating = criticRating
    }
}
