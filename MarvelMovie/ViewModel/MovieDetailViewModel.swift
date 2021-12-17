//
//  MovieDetailViewModel.swift
//  MarvelMovie
//
//  Created by Mehu on 17/12/21.
//  Copyright © 2021 naveen. All rights reserved.
//

import Foundation
import Alamofire

protocol MovieDetailViewModelDelegate {
    func getMovieDetailResponse(result: Codable?, error: Error?)
}

class MovieDetailViewModel {
    var movieDetailDelegate: MovieDetailViewModelDelegate?
    
    func getMovieDetail(imdbID: String) {
        Alamofire.request(APIRouter.get(imdbID: imdbID, isMovieList: false)).response { (response) in
            guard response.error == nil  else {
                print(response.error ?? "Response Error")
                return
            }
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(MovieDetail.self, from: data)
                    print("Result : ", result)
                    self.movieDetailDelegate?.getMovieDetailResponse(result: result, error: nil)
                }
                catch {
                    self.movieDetailDelegate?.getMovieDetailResponse(result: nil, error: "data error" as? Error)
                }
            }
        }
    }
}
