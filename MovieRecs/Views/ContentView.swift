import SwiftUI
import CoreData


struct ContentView: View {
  @StateObject var api = APIModel()
  @State var query = ""
  @State var movieTitle = "Default"
  @State var movieResults : [TMDBMovie] = []
  @ObservedObject var flow = AppFlow()
    var body : some View {
        ZStack{
            if (flow.loggedIn) {
                Text("Home")
            } else if (!flow.loggedIn && flow.hasAccount ) {
                SignInView(flow : flow)
            } else if (!flow.loggedIn){
                SignUpView(flow : flow)
            }
            
        }}
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

