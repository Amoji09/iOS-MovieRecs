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
            Spacer()
            NavigationLink(destination: SearchView(flow: flow)) {
              Image(systemName: "magnifyingglass")
            }.frame(width:30,height:30)
          }.padding()
          TierView(tierType: "S", color: Color(red: 237/255, green: 15/255, blue: 80/255), flow: flow)
          TierView(tierType: "A", color: Color(red: 203/255, green: 48/255, blue: 96/255), flow: flow)
          TierView(tierType: "B", color: Color(red: 190/255, green: 49/255, blue: 184/255), flow: flow)
          TierView(tierType: "C", color: Color(red: 209/255, green: 74/255, blue: 150/255), flow: flow)
          TierView(tierType: "D", color: Color(red: 223/255, green: 129/255, blue: 51/255), flow: flow)
          TierView(tierType: "F", color: Color(red: 244/255, green: 214/255, blue: 47/255), flow: flow)
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
    @State var popularMovies : [TMDBMovie] = []
    let popularMovieColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
  @ObservedObject var flow : AppFlow
  var body: some View{
    ZStack{
      Color("LoginBackground")
        .ignoresSafeArea()
      VStack{
        HStack{
          TextField("Movie Title", text: $query).padding().background(Color("TextFieldBackground")).cornerRadius(5).foregroundColor(Color.white)
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
        }.padding()
          if (self.movieResults.count > 0) {
              List{
                  ForEach(movieResults) { movie in
                      NavigationLink(destination: MovieResultView(movie: movie, flow: flow)) {
                          Text(movie.title).foregroundColor(Color.white)
                      }.listRowBackground(Color("TextFieldBackground"))
                  }
              }.background(Color("LoginBackground")).scrollContentBackground(.hidden)
          } else {
              LazyVGrid(columns: popularMovieColumns, spacing:20) {
                  ForEach(popularMovies) { movie in
                      NavigationLink(destination: MovieResultView(movie: movie, flow: flow)) {
                          AsyncImage(url:URL(string: "https://image.tmdb.org/t/p/w500/https://image.tmdb.org/t/p/original/\(movie.poster_path ?? "null")")) {phase in
                              switch phase{
                              case .success(let image):
                                  image
                                      .resizable()
                                      .scaledToFill()
                              default:
                                  Image(systemName: "photo")
                              }
                          }
                              .frame(width:100, height: 175).cornerRadius(5)
                      }
                  }
              }
          }
      }
      .onAppear {
          api.fetchPopularFilms(completionHandler:
                {(films) in
              self.popularMovies = Array(films.prefix(9))
          })
      }
    }}
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
  @ObservedObject var flow : AppFlow
  var body: some View{
    
    HStack{
      //Color.red
      Spacer(minLength: 40)
      RoundedRectangle(cornerRadius: 12)
        .fill(color)
        .frame(width: 100, height: 100)
        .overlay(Text(tierType).font(.largeTitle))
      Spacer(minLength: 6)
      //      RoundedRectangle(cornerRadius: 12)
      //        .fill(Color(red: 28/255, green: 39/255, blue: 52/255))
      //        .frame(width: 300, height: 100)
      //      Spacer(minLength: 0)
      HStack{
        ForEach(flow.user.movies[tierType] ?? []) { movie in
          AsyncImage(url:URL( string: "https://image.tmdb.org/t/p/w500/https://image.tmdb.org/t/p/original/\(movie.poster_path ?? "null")"), scale: 7)
            .frame(width:200, height: 200).cornerRadius(5).padding()
        }
      }
      Spacer()
    }
    
  }
}

struct TierListView_Previews: PreviewProvider {
  static var previews: some View {
    TierListView(flow: AppFlow())
  }
}

