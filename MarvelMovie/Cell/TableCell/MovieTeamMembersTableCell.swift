//
//  MoviewTeamMembersTableCell.swift
//  MarvelMovie
//
//  Created by Mehu on 17/12/21.
//  Copyright © 2021 naveen. All rights reserved.
//

import UIKit

class MovieTeamMembersTableCell: UITableViewCell {
    @IBOutlet weak var director: UILabel!
    
    @IBOutlet weak var writer: UILabel!
    @IBOutlet weak var editor: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(movieDetail: MovieDetail) {
        director.text = movieDetail.director
        writer.text = movieDetail.writer
        editor.text = movieDetail.actors
    }

}
