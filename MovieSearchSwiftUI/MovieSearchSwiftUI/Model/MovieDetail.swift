//
//  MovieDetail.swift
//  MovieSearchSwiftUI
//
//  Created by Barış Yeşilkaya on 13.10.2022.
//

import Foundation

struct MovieDetail: Codable {
    
    let title: String
    let released: String
    let runtime: String
    let genre: String
    let director: String
    let actors: String
    let plot: String
    let metaScore: String
    let imdbRating: String
    let imdbID: String
    let type: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case actors = "Actors"
        case plot = "Plot"
        case metaScore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}
