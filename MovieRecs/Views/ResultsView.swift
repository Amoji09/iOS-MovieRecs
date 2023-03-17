//
//  ResultsView.swift
//  MovieRecs
//
//  Created by Rhea Garg and Tanishqa Kuchi on 3/14/23.
//

import SwiftUI

struct Previews_ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        
        //struct ResultsView: View {
        let movie : TMDBMovie
            var body: some View {
                ZStack{
                    Color("LoginBackground")
                        .ignoresSafeArea()
                    
                    VStack(alignment: .center, spacing: 20) {
                        //concatenate with a movie.poster path
                        Image("checkmark")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .clipShape(Rectangle())
                            .overlay(Circle().stroke(Color.white,lineWidth: 4))
                            .shadow(color: .white, radius: 7)
                            .aspectRatio(contentMode: .fit)
                        
                        HStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.gray)
                                .frame(width: 100, height: 100)
                                .overlay(Text(movie.title).font(.title))
                        }
                    }
                }
            }
        }
    }
