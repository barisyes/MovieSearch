//
//  ContentView.swift
//  FilmSearchSwiftUI
//
//  Created by Barış Yeşilkaya on 11.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var movieListViewModel = MovieListViewModel()

    @State var searchingMovie = ""
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                TextField("Searching Movie", text: $searchingMovie) {
                    self.movieListViewModel.doSearchMovie(movieName: searchingMovie.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters:.urlHostAllowed) ?? searchingMovie)
                }.padding()
                    .textFieldStyle(.roundedBorder)
                
                List(movieListViewModel.movies, id: \.imdbID){ item in
                    
                    NavigationLink {
                        DetailView(imdbID: item.imdbID)
                    } label: {
                        HStack(){
                            CustomImage(url: item.poster)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width*0.2)
                            VStack(alignment: .leading){
                                Text(item.title)
                                    .foregroundColor(.blue)
                                Text(item.year)
                                    .foregroundColor(.orange)
                            }
                        }
                    }
                }.navigationTitle("Movie Book")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
