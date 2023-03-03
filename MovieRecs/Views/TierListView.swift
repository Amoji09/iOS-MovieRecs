import SwiftUI

struct TierListView: View {
    //var data = ["S", "A", "B", "C", "D", "E", "F"]
    var body: some View {
        ZStack {
            Color.black
            .ignoresSafeArea()
            //.ignoresSafeArea()
            //.background(Color.red)
            VStack {
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
        }
    }
    
    struct TierListViewNav: View {
       var body: some View {
          NavigationView {
             NavigationLink(destination: SearchView()) {
             }.buttonStyle(PlainButtonStyle())
          }
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
                    .frame(width: 120, height: 120)
                    .overlay(Text(tierType).font(.largeTitle))
                Spacer(minLength: 6)
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(red: 28/255, green: 39/255, blue: 52/255))
                    .frame(width: 330, height: 120)
                Spacer(minLength: 0)
            }
        }
    }
    
    struct TierListView_Previews: PreviewProvider {
        static var previews: some View {
            TierListView()
        }
    }
}

