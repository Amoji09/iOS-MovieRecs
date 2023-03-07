import SwiftUI
import CoreData

struct ContentView: View {
  var body: some View{
    Text("hello")
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

