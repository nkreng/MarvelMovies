//
//  APIRouter.swift
//  MarvelMovie
//
//  Created by Mehu on 16/12/21.
//  Copyright © 2021 naveen. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    
    static let baseURLString = "http://www.omdbapi.com/"
    static let apiKey = "?apikey=b9bd48a6"
    
    case get(imdbID: String?, isMovieList: Bool)
    
    func asURLRequest() throws -> URLRequest {
        
        var method: HTTPMethod {
            switch self {
            case .get:
                return .get
            }
        }
        
        let url: URL = {
            var relativeURLPath: String?
            switch self {
            case .get(let imdbID, let isMovieList):
                if isMovieList {
                    relativeURLPath = "\(APIRouter.apiKey)&s=Marvel&type=movie"
                }
                else {
                    if let imdb = imdbID {
                        relativeURLPath = "\(APIRouter.apiKey)&&i=\(imdb)"
                    }
                }
            }
            
            var url = URL(string: APIRouter.baseURLString)
            if let relativePath = relativeURLPath {
                url = url.flatMap{ URL(string: $0.absoluteString + relativePath) }
            }
            return url!
        }()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: nil)
    }
    
}
