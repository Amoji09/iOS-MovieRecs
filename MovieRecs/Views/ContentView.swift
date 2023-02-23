import SwiftUI
import CoreData

struct ContentView: View {
  @StateObject var api = APIModel()
  @State var query = ""
  @State var movieTitle = "Default"
  @State var movieResults : [TMDBMovie] = []
    var body: some View{
      VStack{
        HStack{
          TextField("Movie Title", text: $query)
          Button(action:{
            if query.count > 0{
              api.loadMovie(movieName: query)
            }
          }){
            Text("Search")
          }
        }
        if let movieResponse = api.apiResponse{
          List {
            ForEach(movieResponse.results) { movie in
              MovieResultView(movie: movie)
            }
          }
        }
      
      }
    }
  }

struct MovieResultView : View{
  let movie : TMDBMovie
  
  var body : some View {
    VStack{
      Text(movie.title)
    }
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

