import SwiftUI

struct TierListView: View {
  //var data = ["S", "A", "B", "C", "D", "E", "F"]
  @ObservedObject var flow : AppFlow
  var body: some View {
    NavigationView {
      ZStack{
        Color("LoginBackground")
            .ignoresSafeArea()
        VStack {
          //ForEach(data,id: \.self){ data in
          //Color.red
          //.ignoresSafeArea()
          //.background(Color.red)
          //Color.red
          HStack{
            
            NavigationLink(destination: SearchView()) {
              Image(systemName: "magnifyingglass")
            }.frame(width:30,height:30)
          }
          TierView(tierType: "S", color: Color(red: 237/255, green: 15/255, blue: 80/255))
          TierView(tierType: "A", color: Color(red: 203/255, green: 48/255, blue: 96/255))
          TierView(tierType: "B", color: Color(red: 190/255, green: 49/255, blue: 184/255))
          TierView(tierType: "C", color: Color(red: 209/255, green: 74/255, blue: 150/255))
          TierView(tierType: "D", color: Color(red: 223/255, green: 129/255, blue: 51/255))
          TierView(tierType: "F", color: Color(red: 244/255, green: 214/255, blue: 47/255))
          //.lineSpacing(20)
          
       }
//        .padding(.leading, 40).padding(.trailing, 40)
      }
    }
  }
}

struct SearchView: View {
  @StateObject var api = APIModel()
  @State var query = ""
  @State var movieTitle = "Default"
  @State var movieResults : [TMDBMovie] = []
@State var popmovieResults : [TMDBMovie] = []
    func generatePop() {
            print("Call popular movie api")
            api.fetchPopularFilms(completionHandler: {(films) in
                self.popmovieResults = films
            })
    }
    let backgroundGradient = LinearGradient(colors: [Color(red: 118/255, green: 16/255, blue: 35/255), Color.black], startPoint: .top, endPoint: .bottomLeading)
   
  var body: some View{
      let _ = generatePop()
      VStack{
          HStack{
              TextField("Search for a movie", text: $query).frame(width: 250.0, height: 45.0).background(Color.black).cornerRadius(7).foregroundColor(Color.white).accentColor(Color.white)
              Button(action:{
                  if (query.count > 0){
                      print("Call api")
                      api.fetchFilms(movieName: query, completionHandler: {(films) in
                          self.movieResults = films
                      })
                  }
              }){
                  Image(systemName: "magnifyingglass").foregroundColor(Color.white)
              }
          }.padding()
          
          List{
            ForEach(popmovieResults) { movie in
              MovieResultView(movie: movie)
            }
          }
        List{
          ForEach(movieResults) { movie in
            MovieResultView(movie: movie)
          }
        }
      }
      .background(backgroundGradient)
  }
}
//struct TierView: View {
//  var body: some View{
//    ZStack {
//  .background(Color(red: 20/255, green: 14/255, //blue: 12/255))
//}
//}

struct TierView: View {
  let tierType: String
  let color: Color
  var body: some View{
    
    HStack{
      //Color.red
      Spacer(minLength: 40)
      RoundedRectangle(cornerRadius: 12)
        .fill(color)
        .frame(width: 100, height: 100)
        .overlay(Text(tierType).font(.largeTitle))
      Spacer(minLength: 6)
      RoundedRectangle(cornerRadius: 12)
        .fill(Color(red: 28/255, green: 39/255, blue: 52/255))
        .frame(width: 300, height: 100)
      Spacer(minLength: 0)
    }
  }
}

struct TierListView_Previews: PreviewProvider {
  static var previews: some View {
    TierListView(flow: AppFlow())

  }
}

