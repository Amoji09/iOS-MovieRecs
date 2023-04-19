

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
  
  func fetchFilms(movieName : String, completionHandler: @escaping ([TMDBMovie]) -> Void) {
    let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=368a7896ffc986e82822a2f2dc5cf33e&query=\(movieName)")!
    
    
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
      if let error = error {
        print("Error with fetching films: \(error)")
        return
      }
      guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
        print("Error with the response, unexpected status code: \(response)")
        return
      }
      if let data = data {
        do {
          let decodedResponse = try JSONDecoder().decode(TMDBResponse.self, from: data)
          //                    print(decodedResponse.total_results)
          completionHandler(decodedResponse.results)
        } catch {
          print("error: ", error)
        }
      }
    })
    task.resume()
  }
  
  func fetchRecs(movies: [String: [TMDBMovie]], completionHandler: @escaping ([String: [TMDBMovie]]) -> Void) {
        // dict to hold all recommendations
        var recommendations: [String: [TMDBMovie]] = [:]
        // loop through users movies
        for (key, value) in movies {
            // make sure good movies
            if key == "S" || key == "A" || key == "B" {
                // go through each movie in assigned list
                for movieNeedingRec in value {
                    let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieNeedingRec.id)/recommendations?api_key=368a7896ffc986e82822a2f2dc5cf33e")!
                    
                    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                        if let error = error {
                            print("Error with fetching films: \(error)")
                            return
                        }
                        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                            print("Error with the response, unexpected status code: \(response)")
                            return
                        }
                        if let data = data {
                            do {
                                let decodedResponse = try JSONDecoder().decode(TMDBResponse.self, from: data)
                                //make sure this is a valid request
                                if let firstMovie = decodedResponse.results.first {
                                    // check if the key exists in recs
                                    if recommendations[key] == nil {
                                        //if its not in dictionary, create it with firstMovie
                                        recommendations[key] = [firstMovie]
                                    } else {
                                        // keep adding the first rec response for each movie in that value
                                       recommendations[key]!.append(firstMovie)
                                    }
                                }
                            } catch {
                                print("error: ", error)
                            }
                        }
                        // finish it
                        if recommendations.keys.sorted() == ["A", "B", "S"] {
                            print("these are the recs")
                            print(recommendations)
                            completionHandler(recommendations)
                        }
                    }
                    task.resume()
                }
            }
        }
    }
  
  func fetchPopularFilms(completionHandler: @escaping ([TMDBMovie]) -> Void) {
    let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=368a7896ffc986e82822a2f2dc5cf33e&&language=en-US&page=1")!
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
      if let error = error {
        print("Error with fetching films: \(error)")
        return
      }
      guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
        print("Error with the response, unexpected status code: \(response)")
        return
      }
      if let data = data {
        do {
          let decodedResponse = try JSONDecoder().decode(TMDBResponse.self, from: data)
          //                    print(decodedResponse.total_results)
          completionHandler(decodedResponse.results)
        } catch {
          print("error: ", error)
        }
      }
    })
    task.resume()
  }
  
  func fetchCastCrew(movieId : Int,completionHandler: @escaping ([TMDBCast]) -> Void) {
    let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)/credits?api_key=368a7896ffc986e82822a2f2dc5cf33e&language=en-US")!
    
    
    
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
      if let error = error {
        print("Error with fetching films: \(error)")
        return
      }
      guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
        print("Error with the response, unexpected status code: \(response)")
        return
      }
      if let data = data {
        do {
          let decodedResponse = try JSONDecoder().decode(TMDBCastCrew.self, from: data)
          //                  print(decodedResponse.cast)
          completionHandler(decodedResponse.cast)
        } catch {
          print("error: ", error)
        }
      }
    })
    task.resume()
  }
}
struct TMDBResponse : Codable {
  let page : Int
  let results : [TMDBMovie]
  let total_pages : Int
  let total_results : Int
}

struct TMDBMovie : Codable, Identifiable, Equatable {
  let adult: Bool
  let backdrop_path: String?
  let genre_ids: [Int]
  let id : Int
  let original_language: String
  let original_title: String
  let overview: String
  let popularity: Float
  let poster_path: String?
  let release_date: String
  let title: String
  let video: Bool
  let vote_average: Float
  let vote_count : Int
  
  public static func ==(movie1: TMDBMovie, movie2: TMDBMovie) -> Bool{
    return movie1.id == movie2.id
  }
}
