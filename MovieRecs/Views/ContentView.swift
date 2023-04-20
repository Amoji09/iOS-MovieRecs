import SwiftUI
import CoreData


struct ContentView: View {
  @StateObject var flow = AppFlow.shared
  var body : some View {
    ZStack{
      if (flow.loggedIn) {
        MainView()
      } else if (!flow.loggedIn && flow.hasAccount ) {
        SignInView()
      } else if (!flow.loggedIn){
        SignUpView()
      }
      
    }
  }
}

struct MainView : View {
  @ObservedObject var flow = AppFlow.shared
  var body : some View{
    TabView {
      TierListView(flow: flow).tabItem{
        Label("Tiers", systemImage: "house")
      }
      
      RecommendationsView().tabItem {
        Label("Recommendations", systemImage: "popcorn.fill")
      }
      SearchView(flow: flow).tabItem{
        Label("Search", systemImage: "magnifyingglass")
      }
      
      UserProfile(flow : flow).tabItem{
        Label("User", systemImage: "person.fill")
        
      }
      //      DataBaseView().tabItem{
      //        Label("DatabaseTest", systemImage: "list.dash.header.rectangle")
      //      }
      
    }
  }
}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

