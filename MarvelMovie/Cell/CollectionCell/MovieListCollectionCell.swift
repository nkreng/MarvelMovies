//
//  MovieListCollectionCell.swift
//  MarvelMovie
//
//  Created by Mehu on 17/12/21.
//  Copyright © 2021 naveen. All rights reserved.
//

import UIKit

class MovieListCollectionCell: UICollectionViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    func updateUI(search: Search) {
        if let url = URL(string: search.poster), let data = try? Data(contentsOf: url) {
            movieImage.image = UIImage(data: data)
        }
        movieTitle.text = search.title
    }
}
