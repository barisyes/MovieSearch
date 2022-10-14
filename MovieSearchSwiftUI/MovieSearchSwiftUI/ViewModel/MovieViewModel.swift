//
//  MovieViewModel.swift
//  MovieSearchSwiftUI
//
//  Created by Barış Yeşilkaya on 12.10.2022.
//

import Foundation
import SwiftUI

class MovieListViewModel: ObservableObject{

    @Published var movies = [MovieViewModel]()

    let downloaderClient = DownloaderClient()

    func doSearchMovie(movieName: String) {
        downloaderClient.downloadMovies(search: movieName) { item in
            switch item {
            case.failure(let error):
                print("\(error) MovieViewLoad")
            case.success(let movieList):
                if let movieList = movieList {
                    DispatchQueue.main.async {
                        self.movies = movieList.map(MovieViewModel.init)
                    }
                }
            }
        }
    }

}

struct MovieViewModel {
    let movie: Movie

    var title: String {
        return movie.title
    }

    var poster: String {
        return movie.poster
    }

    var year: String {
        return movie.year
    }

    var imdbID: String {
        return movie.imdbID
    }
    
    var type: String {
        return movie.type
    }
}
