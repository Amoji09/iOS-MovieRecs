import SwiftUI
import CoreData


struct ContentView: View {
  @ObservedObject var flow = AppFlow()
    var body : some View {
        ZStack{
            if (flow.loggedIn) {
              MainView(flow: flow)
            } else if (!flow.loggedIn && flow.hasAccount ) {
                SignInView(flow : flow)
            } else if (!flow.loggedIn){
                SignUpView(flow : flow)
            }
            
        }
  }
}

struct MainView : View {
  @ObservedObject var flow : AppFlow
  var body : some View{
    TabView {
      TierListView(flow: flow).tabItem{
        Label("Tiers", systemImage: "house")
      }
      UserProfile(flow : flow).tabItem{
        Label("User", systemImage: "house")
        
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

