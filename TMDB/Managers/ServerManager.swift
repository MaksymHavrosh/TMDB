//
//  ServerManager.swift
//  TMDB
//
//  Created by MG on 15.09.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import Foundation
import Alamofire

struct ServerManager {
    
    private static let baseURL = "https://api.themoviedb.org/3/"
    private static let apiKey = "f910e2224b142497cc05444043cc8aa4"
    private static let language = "ru-RU"
    
    static func getPopularMovies(page: Int, success: @escaping ([Movie]) -> Void) {
        
        AF.request(baseURL + "movie/top_rated?api_key=" + apiKey + "&language=" + language + "&page=" + "\(page)",
                   method: .get,
                   encoding: URLEncoding.default).responseJSON { (response) in
                    
                    switch response.result {
                    case .success(let value):
                        
                        guard let value = value as? [String: Any], let results = value["results"] as? [[String: Any]] else { return }
                        var movies = [Movie]()
                        
                        for movieDictionary in results {
                            let movie = Movie(movieDictionary)
                            movies.append(movie)
                        }
                        success(movies)
                        
                    case .failure(let error):
                        print(error)
                    }
        }
    }

    static func searchMovie(query: String, page: Int, success: @escaping ([Movie]) -> Void) {
        
        AF.request(baseURL + "search/movie?api_key=" + apiKey + "&language=" + language + "&query=" + query + "&page=" + "\(page)",
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default).responseJSON { (response) in
                    
                    switch response.result {
                    case .success(let value):
                        
                        guard let value = value as? [String: Any], let results = value["results"] as? [[String: Any]] else { return }
                        var movies = [Movie]()
                        
                        for movieDictionary in results {
                            let movie = Movie(movieDictionary)
                            movies.append(movie)
                        }
                        success(movies)
                        
                    case .failure(let error):
                        print(error)
                    }
        }
    }
}
