//
//  MovieList.swift
//  MarvelMovie
//
//  Created by Mehu on 16/12/21.
//  Copyright © 2021 naveen. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct MovieList: Codable {
    let search: [Search]
    let totalResults, response: String
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Search
struct Search: Codable {
    let title, year, imdbID: String
    let type: TypeEnum
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

enum TypeEnum: String, Codable {
    case movie = "movie"
}
