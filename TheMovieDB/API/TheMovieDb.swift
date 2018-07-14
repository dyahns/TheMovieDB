//
//  TheMovieDb.swift
//  TheMovieDB
//
//  Created by D Yahns on 14/07/2018.
//

import Foundation

struct TheMovieDb: MovieDataSource {
    static let baseUrl = "https://api.themoviedb.org/3/%@?api_key=%@"
    static let apiKeySettingKey = "api_key"

    private var apiKey: String? {
        guard let apiKey = UserDefaults.standard.string(forKey: TheMovieDb.apiKeySettingKey), !apiKey.trimmingCharacters(in: .whitespaces).isEmpty else {
            return nil
        }

        return apiKey
    }
    
    func fetchNowPlaying(completion: @escaping ([Movie])->()) {
        makeRequest(path: "movie/now_playing") { (data) in
            completion(TheMovieDBDecoder.parseNowPlaying(data))
        }
    }

    func fetchMovie(id: Int, completion: @escaping (MovieDetails)->()) {
        makeRequest(path: "movie/\(id)") { (data) in
            completion(TheMovieDBDecoder.parseMovie(data))
        }
    }

    func fetchCollection(id: Int, completion: @escaping ([Movie])->()) {
        makeRequest(path: "collection/\(id)") { (data) in
            completion(TheMovieDBDecoder.parseCollection(data))
        }
    }
    
    private func makeRequest(path: String, completion: @escaping (Data)->()) {
        guard let apiKey = apiKey else {
            print("--------------------------------------------------------------------")
            print("|                                                                  |")
            print("|   Please, provide TheMovieDB API key in Settings -> TheMovieDB.  |")
            print("|                                                                  |")
            print("--------------------------------------------------------------------")
            return
        }
        
        guard let url = URL(string: String(format: TheMovieDb.baseUrl, path, apiKey)) else {
            print("Invalid URL.")
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) -> Void in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
                print("Invalid response or empty data")
                return
            }
            
            completion(data)
        }
        
        dataTask.resume()
    }
}
