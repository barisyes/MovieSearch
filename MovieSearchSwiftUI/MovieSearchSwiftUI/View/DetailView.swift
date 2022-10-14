//
//  DetailView.swift
//  MovieSearchSwiftUI
//
//  Created by Barış Yeşilkaya on 13.10.2022.
//

import SwiftUI

struct DetailView: View {
    
    let imdbID: String
    
    @ObservedObject var movieDetailViewModel = MovieDetailViewModel()
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading) {
                
                HStack{
                    Spacer()
                    CustomImage(url: movieDetailViewModel.movieDetail?.poster ?? "")
                        .frame(width: UIScreen.main.bounds.width*0.8)
                        .shadow(radius: 10)
                    Spacer()
                }.padding(.bottom)
                Group {
                    HStack{
                        Spacer()
                        Text(movieDetailViewModel.movieDetail?.title ?? "Movie name loading.")
                            .font(Font.system(size: 30))
                            .bold()
                        Spacer()
                    }.padding(.bottom)
                    
                    Text("Released: ").bold() + Text(movieDetailViewModel.movieDetail?.released ?? "Released loading.")
                    
                    Text("Time: ").bold() + Text(movieDetailViewModel.movieDetail?.runtime ?? "Runtime loading.")
                    
                    Text("Genre: ").bold() + Text(movieDetailViewModel.movieDetail?.genre ?? "Genre loading.")
                    
                    Text("Director: ").bold() + Text(movieDetailViewModel.movieDetail?.director ?? "Director loading.")
                    
                    Text("Actors: ").bold() + Text(movieDetailViewModel.movieDetail?.actors ?? "Actors loading.")
                    
                    Text("Plot: ").bold() + Text(movieDetailViewModel.movieDetail?.plot ?? "Plot loading.")
                    
                    Text("Metoscore: ").bold() + Text(movieDetailViewModel.movieDetail?.metaScore ?? "Metascore loading.")
                    
                    Text("Imdb Rating: ").bold() + Text(movieDetailViewModel.movieDetail?.imdbRating ?? "Imdb rating loading.")
                    
                    Text("Type: ").bold() + Text(movieDetailViewModel.movieDetail?.type ?? "Type loading.")
                    
                }.padding(.bottom)
                
            }.onAppear {
                self.movieDetailViewModel.getMovieDetail(movieID: imdbID)
            }
            .padding([.leading, .trailing])
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbID: "test")
    }
}
