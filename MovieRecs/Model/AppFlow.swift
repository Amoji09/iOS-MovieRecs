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
  @Published var user : User = User(email: "default", username: "default", password: "default", movies: ["S":[TMDBMovie](),"A":[TMDBMovie](),"B":[TMDBMovie](),"C":[TMDBMovie](),"D":[TMDBMovie](),"F":[TMDBMovie]()])
  
}
