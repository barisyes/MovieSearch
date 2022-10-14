//
//  DownloaderClient.swift
//  MovieSearchSwiftUI
//
//  Created by Barış Yeşilkaya on 11.10.2022.
//

import Foundation

class DownloaderClient {
    
    func downloadMovies(search: String, completion: @escaping (Result<[Movie]?, DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=2a40e23a") else {
            return completion(.failure(.yanlisUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else{
                return completion(.failure(.veriGelmedi))
            }
            
            guard let movieAnswer = try? JSONDecoder().decode(IncomingMovies.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            
            completion(.success(movieAnswer.movies))
            
        }.resume()
        
    }
    
    func downloadMovieDetail(imdbID: String, completion: @escaping (Result<MovieDetail, DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbID)&apikey=2a40e23a") else {
            return completion(.failure(.yanlisUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let incoming = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            
            completion(.success(incoming))
            
        }.resume()
    }
}


enum DownloaderError: Error {
    case yanlisUrl
    case veriGelmedi
    case veriIslenemedi
}
