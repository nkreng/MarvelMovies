//
//  MovieRatingsReviewCell.swift
//  MarvelMovie
//
//  Created by Mehu on 17/12/21.
//  Copyright © 2021 naveen. All rights reserved.
//

import UIKit

class MovieRatingsReviewTableCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var synopsis: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var reviews: UILabel!
    @IBOutlet weak var popularity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(movieDetail: MovieDetail) {
        time.text = movieDetail.runtime
        rating.text = movieDetail.rated
        synopsis.text = movieDetail.plot
        score.text = movieDetail.metascore
        reviews.text = movieDetail.imdbRating
        popularity.text = movieDetail.imdbVotes
    }

}
