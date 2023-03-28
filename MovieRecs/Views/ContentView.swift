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
        Label("User", systemImage: "person.fill")
        
      }
//      DataBaseView().tabItem{
//        Label("DatabaseTest", systemImage: "list.dash.header.rectangle")
//      }
      
    }
  }
}
  
  struct MovieResultView : View{
    let movie : TMDBMovie
    
    var body : some View {
      ZStack{
        Color("LoginBackground")
          .ignoresSafeArea()
        
        VStack(alignment: .center, spacing: 20) {
          
          AsyncImage(url:URL( string: "https://image.tmdb.org/t/p/w500/https://image.tmdb.org/t/p/original/\(movie.poster_path ?? "null")"), scale: 7)
            .frame(width:500, height: 500).cornerRadius(5).padding()
          HStack {
            RoundedRectangle(cornerRadius: 12).fill(.white).frame(width:300, height: 100).overlay(Text(movie.title).font(.title))
          }.padding()
            
        }
      }
    }
  }
  
  
  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
  }
  
