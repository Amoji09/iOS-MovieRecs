import Foundation
import SwiftUI

    struct TMDBCastCrew: Codable {

        let id: Int
        let cast: [TMDBCast]
        let crew: [TMDBCrew]

    }
    struct TMDBCast: Codable {
        let adult : Bool
        let gender : Int?
        let id : Int
        let known_for_department : String
        let name : String
        let original_name : String
        let popularity : Float
        let profile_path : String?
        let cast_id : Int
        let character : String
        let credit_id : String
        let order : Int

    }

    struct TMDBCrew: Codable {
        let adult : Bool
        let gender : Int?
        let id : Int
        let known_for_department : String
        let name : String
        let original_name : String
        let popularity : Float
        let profile_path : String?
        let credit_id : String
        let department : String
        let job : String
    }
