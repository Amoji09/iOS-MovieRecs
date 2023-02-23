

import Foundation
import Combine


class APIModel: ObservableObject {
  static let shared = APIModel()
  @Published var apiResponse : TMDBResponse?
  
  func loadMovie(movieName : String){
    var results : [TMDBMovie] = []
    let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=368a7896ffc986e82822a2f2dc5cf33e&query=\(movieName)")!
    Task {
      let (data, _) = try await URLSession.shared.data(from: url)
      let decodedResponse = try? JSONDecoder().decode(TMDBResponse.self, from: data)
      apiResponse = decodedResponse
    }
    
  }
}
  
  struct TMDBResponse : Codable {
    let page : Int
    let results : [TMDBMovie]
    let total_pages : Int
    let total_results : Int
  }
  
  struct TMDBMovie : Codable, Identifiable {
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id : Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Float
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Float
    let vote_count : Int
  }
