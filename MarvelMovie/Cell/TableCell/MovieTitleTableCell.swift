//
//  MovieTitleCell.swift
//  MarvelMovie
//
//  Created by Mehu on 17/12/21.
//  Copyright © 2021 naveen. All rights reserved.
//

import UIKit

class MovieTitleTableCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleasedYear: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(movieDetail: MovieDetail) {
        if let url = URL(string: movieDetail.poster), let data = try? Data(contentsOf: url) {
            movieImage.image = UIImage(data: data)
        }
        movieTitle.text = movieDetail.title
        movieReleasedYear.text = movieDetail.year
        
    }

}
