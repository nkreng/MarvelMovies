//
//  MovieDetailViewController.swift
//  MarvelMovie
//
//  Created by Mehu on 17/12/21.
//  Copyright © 2021 naveen. All rights reserved.
//

import UIKit

enum CellType: String {
    case MovieTitleTableCell
    case MovieRatingsReviewTableCell
    case movieTeamMembers
}

class MovieDetailViewController: UIViewController {
    
    var imdbID: String?
    var movieDetail: MovieDetail?
    let viewModel = MovieDetailViewModel()
    var type: CellType?

    @IBOutlet weak var movieDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel.movieDetailDelegate = self
        // Display activity inidicator
        showActivityIndicator()
        // API to get the list of Movies
        if let imdb = imdbID {
            viewModel.getMovieDetail(imdbID: imdb)
        }
        navigationItem.title = Constants.movieDetail
        movieDetailTableView.rowHeight = UITableView.automaticDimension
        movieDetailTableView.estimatedRowHeight = 80
        movieDetailTableView.tableFooterView = UIView()
    }
    
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.movieTitleCell) as? MovieTitleTableCell else { return UITableViewCell()}
            if let details = movieDetail {
                cell.updateUI(movieDetail: details)
            }
            return cell
        }
        else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.movieRatingsReviewCell) as? MovieRatingsReviewTableCell else { return UITableViewCell()}
            if let details = movieDetail {
                cell.updateUI(movieDetail: details)
            }
            return cell
        }
        else if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.movieTeamMembersCell) as? MovieTeamMembersTableCell else { return UITableViewCell()}
            if let details = movieDetail {
                cell.updateUI(movieDetail: details)
            }
            return cell
        }
        return UITableViewCell()
    }

}

// Implement MovieDetailViewModelDelegate method
extension MovieDetailViewController: MovieDetailViewModelDelegate {
    
    // Get movie detail response
    func getMovieDetailResponse(result: Codable?, error: Error?) {
        // Hide Acitivity Indicator
        self.hideActivityIndicator()
        if error == nil, let result = result as? MovieDetail {
            movieDetail = result
            DispatchQueue.main.async {
                self.movieDetailTableView.reloadData()
            }
        }
        
    }

}
