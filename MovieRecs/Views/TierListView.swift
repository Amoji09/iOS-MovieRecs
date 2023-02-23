//
//  TierListView.swift
//  MovieTiers
//
//  Created by Abhinn Vegesna on 10/13/22.
//

import SwiftUI

struct TierListView: View {
    //var data = ["S", "A", "B", "C", "D", "E", "F"]

    
    var body: some View {
        ZStack {
            Color.black//.ignoresSafeArea()
            //.ignoresSafeArea()
            //.background(Color.red)
        VStack(alignment: .leading, spacing: 4) {
            
            //ForEach(data,id: \.self){ data in
            //Color.red
            //.ignoresSafeArea()
            //.background(Color.red)
            //Color.red
            TierView()
                //.lineSpacing(20)
            .padding(EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0))

                    
                    
            }
        }
                
        .background(Color(red: 28/255, green: 39/255, blue: 52/255))
        
    }
        
    }



//struct TierView: View {
  //  var body: some View{
    //    ZStack {
      //  .background(Color(red: 20/255, green: 14/255, //blue: 12/255))
    //}
//}

struct TierView: View {
    var body: some View{
        HStack{
            //Color.red
            Spacer(minLength: 40)
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(red: 87/255, green: 44/255, blue: 212/255))
                .frame(width: 120, height: 120)
                .overlay(Text("S").font(.largeTitle))
            Spacer(minLength: 6)
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(red: 28/255, green: 39/255, blue: 52/255))
                .frame(width: 330, height: 120)
            Spacer(minLength: 0)
            }
        HStack{
            Spacer(minLength: 40)
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(red: 125/255, green: 53/255, blue: 226/255))
                .frame(width: 120, height: 120)
                .overlay(Text("A").font(.largeTitle))
            Spacer(minLength: 6)
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(red: 28/255, green: 39/255, blue: 52/255))
                .frame(width: 330, height: 120)
            Spacer(minLength: 0)
            }
        HStack{
            Spacer(minLength: 40)
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(red: 131/255, green: 90/255, blue: 172/255))
                .frame(width: 120, height: 120)
                .overlay(Text("B").font(.largeTitle))
            Spacer(minLength: 6)
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(red: 28/255, green: 39/255, blue: 52/255))
                .frame(width: 330, height: 120)
            Spacer(minLength: 0)
            }
        HStack{
            Spacer(minLength: 40)
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(red: 168/255, green: 69/255, blue: 168/255))
                .frame(width: 120, height: 120)
                .overlay(Text("C").font(.largeTitle))
            Spacer(minLength: 6)
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(red: 28/255, green: 39/255, blue: 52/255))
                .frame(width: 330, height: 120)
            Spacer(minLength: 0)
            }
        HStack{
            Spacer(minLength: 40)
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(red: 212/255, green: 77/255, blue: 120/255))
                .frame(width: 120, height: 120)
                .overlay(Text("D").font(.largeTitle))
            Spacer(minLength: 6)
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(red: 28/255, green: 39/255, blue: 52/255))
                .frame(width: 330, height: 120)
            Spacer(minLength: 0)
            }
        HStack{
            Spacer(minLength: 40)
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(red: 217/255, green: 87/255, blue: 103/255))
                .frame(width: 120, height: 120)
                .overlay(Text("E").font(.largeTitle))
            Spacer(minLength: 6)
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(red: 28/255, green: 39/255, blue: 52/255))
                .frame(width: 330, height: 120)
            Spacer(minLength: 0)
            }
        HStack{
            Spacer(minLength: 40)
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(red: 236/255, green: 33/255, blue: 71/255))
                .frame(width: 120, height: 120)
                .overlay(Text("F").font(.largeTitle))
            Spacer(minLength: 6)
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(red: 28/255, green: 39/255, blue: 52/255))
                .frame(width: 330, height: 120)
            Spacer(minLength: 0)
            }
        
    }
    var oneTier: String
    init(){
        oneTier = "S"
        print(oneTier);
    }
}

struct TierListView_Previews: PreviewProvider {
    static var previews: some View {
        TierListView()
    }
}
