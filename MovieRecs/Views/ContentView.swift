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
    @ObservedObject var flow : AppFlow
    var body : some View {
      ZStack{
        Color("LoginBackground")
          .ignoresSafeArea()
        
        VStack(alignment: .center, spacing: 10) {
          
          AsyncImage(url:URL( string: "https://image.tmdb.org/t/p/w500/https://image.tmdb.org/t/p/original/\(movie.poster_path ?? "null")"), scale: 7)
            .frame(width:500, height: 500).cornerRadius(5)
          
          HStack {
            RoundedRectangle(cornerRadius: 12).fill(Color("TextFieldBackground")).frame(width:300, height: 100).overlay(Text(movie.title).font(.title).foregroundColor(Color.white))
          }
            
          
          HStack {
            Button(action:{flow.user.addMovie(tier: "S", movie: movie)}){
                RoundedRectangle(cornerRadius: 2)
                  .fill(Color(red: 237/255, green: 15/255, blue: 80/255))
                  .frame(width: 30, height: 30)
                  .overlay(Text("S").foregroundColor(Color.black))
            }
            Button(action:{flow.user.addMovie(tier: "A", movie: movie)}){
                RoundedRectangle(cornerRadius: 2)
                  .fill(Color(red: 203/255, green: 48/255, blue: 96/255))
                  .frame(width: 30, height: 30).overlay(Text("A").foregroundColor(Color.black))
            }
            Button(action:{flow.user.addMovie(tier: "B", movie: movie)}){
                RoundedRectangle(cornerRadius: 2)
                  .fill(Color(red: 190/255, green: 49/255, blue: 184/255))
                  .frame(width: 30, height: 30)
                  .overlay(Text("B").foregroundColor(Color.black))
            }
            Button(action:{flow.user.addMovie(tier: "C", movie: movie)}){
                RoundedRectangle(cornerRadius: 2)
                  .fill( Color(red: 209/255, green: 74/255, blue: 150/255))
                  .frame(width: 30, height: 30)
                  .overlay(Text("C").foregroundColor(Color.black))
            }
            Button(action:{flow.user.addMovie(tier: "D", movie: movie)}){
                RoundedRectangle(cornerRadius: 2)
                  .fill(Color(red: 223/255, green: 129/255, blue: 51/255))
                  .frame(width: 30, height: 30)
                  .overlay(Text("D").foregroundColor(Color.black))
            }
            Button(action:{flow.user.addMovie(tier: "F", movie: movie)}){
                RoundedRectangle(cornerRadius: 2)
                  .fill(Color(red: 244/255, green: 214/255, blue: 47/255))
                  .frame(width: 30, height: 30)
                  .overlay(Text("F").foregroundColor(Color.black))
            }
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
  
