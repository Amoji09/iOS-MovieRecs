import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var api = APIModel()
    @State var query = ""
    @State var movieTitle = "Default"
    @State var movieResults : [TMDBMovie] = []
    var body: some View{
        VStack{
            ForEach(movieResults) { movie in
                MovieResultView(movie: movie)
            }
            HStack{
                TextField("Movie Title", text: $query)
                Button(action:{
                    if (query.count > 0){
                        print("Call api")
                        api.fetchFilms(movieName: query, completionHandler: {(films) in
                            self.movieResults = films
                        })
                    }
                }){
                    Text("Search")
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

