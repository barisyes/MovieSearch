//
//  MovieDetailViewModel.swift
//  MovieSearchSwiftUI
//
//  Created by Barış Yeşilkaya on 13.10.2022.
//

import Foundation
import SwiftUI

class MovieDetailViewModel: ObservableObject {
    
    @Published var movieDetail: MovieDetailsViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func getMovieDetail(movieID: String) {
        
        downloaderClient.downloadMovieDetail(imdbID: movieID) { (item) in
            switch item {
            case .failure(let error):
                print(error)
            case .success(let movie):
                DispatchQueue.main.async {
                    self.movieDetail = MovieDetailsViewModel(detail: movie)
                }
            }
        }
    }
}

struct MovieDetailsViewModel {
    let detail: MovieDetail
    
    var title: String {
        detail.title
    }
    var released: String {
        detail.released
    }
    var runtime: String {
        detail.runtime
    }
    var genre: String {
        detail.genre
    }
    var director: String {
        detail.director
    }
    var actors: String {
        detail.actors
    }
    var plot: String {
        detail.plot
    }
    var metaScore: String {
        detail.metaScore
    }
    var imdbRating: String {
        detail.imdbRating
    }
    var imdbID: String {
        detail.imdbID
    }
    var type: String {
        detail.type
    }
    var poster: String {
        detail.poster
    }
}
