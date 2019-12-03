//
//  StarWarsData.swift
//  IntroductionToUnitTesting
//
//  Created by Brendon Cecilio on 12/2/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import Foundation

struct StarWarsData: Decodable {
    let results: [StarWarsMovie]
}

struct StarWarsMovie: Decodable {
    let title: String
    let openingCrawl: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case openingCrawl = "opening_crawl"
    }
}

extension StarWarsData {
    static func getMovieInfo(from data: Data) -> [StarWarsMovie] {
        var movies = [StarWarsMovie]()
        
        do {
            let starWarsMovieData = try JSONDecoder().decode(StarWarsData.self, from: data)
            movies = starWarsMovieData.results
        } catch {
            fatalError("this is the error: \(error)")
        }
        return movies
    }
}
