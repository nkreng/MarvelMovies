//
//  MovieListViewModel.swift
//  MarvelMovie
//
//  Created by Mehu on 16/12/21.
//  Copyright © 2021 naveen. All rights reserved.
//

import Foundation
import Alamofire

protocol MovieListViewModelDelegate {
    func getResponse(result: Codable?, error: Error?)
}

class MovieListViewModel {
    
    var movieListViewModelDelegate: MovieListViewModelDelegate?
    
    func getMovieList() {
        Alamofire.request(APIRouter.get(imdbID: nil, isMovieList: true)).response { (response) in
            guard response.error == nil  else {
                print(response.error ?? "Response Error")
                return
            }
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(MovieList.self, from: data)
                    print("Result : ", result)
                    self.movieListViewModelDelegate?.getResponse(result: result, error: nil)
                }
                catch {
                    self.movieListViewModelDelegate?.getResponse(result: nil, error: "data error" as? Error)
                }
            }
        }
    }
}
