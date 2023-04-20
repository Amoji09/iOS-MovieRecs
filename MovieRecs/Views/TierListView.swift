import SwiftUI

struct TierListView: View {
  //var data = ["S", "A", "B", "C", "D", "E", "F"]
  @ObservedObject var flow = AppFlow.shared
  var body: some View {
    NavigationView {
      ZStack{
        Color("LoginBackground")
          .ignoresSafeArea()
        VStack {
          Text("Welcome \(flow.user.username)!").foregroundColor(Color.white).font(.title).bold()
          //ForEach(data,id: \.self){ data in
          //Color.red
          //.ignoresSafeArea()
          //.background(Color.red)
          //Color.red
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

struct TierView: View {
  let tierType: String
  let color: Color
  @ObservedObject var flow = AppFlow.shared
  
  var body: some View{
    
    HStack{
      //Color.red
      Spacer(minLength: 40)
      RoundedRectangle(cornerRadius: 12)
        .fill(color)
        .frame(width: 50, height: 100)
        .overlay(Text(tierType).font(.largeTitle).bold().foregroundColor(Color.black))
      
      RoundedRectangle(cornerRadius : 5).fill(Color.black).frame(width: 300, height: 100).overlay(ScrollView(.horizontal){HStack{
        ForEach(flow.user.movies[tierType] ?? [] ) { movie in
          NavigationLink(destination: MovieResultView(preexisting: true, movie: movie), label: {
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
          .frame(width:95, height: 95).cornerRadius(5)
        })
                         }
      }
      }
      )
      Spacer()
    }
    
  }}

struct TierListView_Previews: PreviewProvider {
  static var previews: some View {
    TierListView(flow: AppFlow())
  }
}

