//
//  DataBaseView.swift
//  MovieRecs
//
//  Created by Amogh Mantri on 3/7/23.
//

import SwiftUI

struct DataBaseView: View {
  @ObservedObject var db = Database()
  @State var city : String = ""
  @State var docName : String = ""
  @State var state : String = ""
  @State var country : String = ""
  @State var cityInfo : String = ""
  var body: some View {
    VStack{
      TextField("City", text: $city)
      TextField("state", text: $state)
      TextField("Country", text: $country)
      TextField("DocName", text: $docName)
      Button(action: {
        let city = City(name: city, state: state, country: country)
        db.addCity(docName : docName, city: city)
      } ) {
        Text("Add city")
      }
      Button(action: {
        db.getCity(docName: docName)
      } ) {
        Text("Get city")
      }
      Text(db.getCityOut)
    }
  }
}

struct DataBaseView_Previews: PreviewProvider {
    static var previews: some View {
        DataBaseView()
    }
}
