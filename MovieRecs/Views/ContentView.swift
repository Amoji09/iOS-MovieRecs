import SwiftUI
import CoreData

struct ContentView: View {
    @State var hasAccount = true
    var body: some View{
        if(hasAccount){
           SignInView()
        }
        else{
            SignUpView()
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

