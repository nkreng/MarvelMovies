//
//  ViewController.swift
//  MarvelMovie
//
//  Created by Mehu on 16/12/21.
//  Copyright © 2021 naveen. All rights reserved.
//

import UIKit
import Alamofire

class MovieListViewController: UIViewController {
    
    let viewModel = MovieListViewModel()
    var movieList: MovieList?
    var filteredMovieListArray = [Search]()

    @IBOutlet weak var movieListCollectionView: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.movieListViewModelDelegate = self
        searchBar.delegate = self
        // Display activity inidicator
        showActivityIndicator()
        // API to get the list of Movies
        viewModel.getMovieList()
        // Gesture to resign keyboard
        hideKeyboardWhenTapped()
        // Movie List
        navigationItem.title = Constants.movieList
    }
    
    // Movie list will be displayed based on search key word text in searchbar
    // Automatically starts filtering the movie once user type the text in searchbar
    func displayMovieList(searchText: String) {
        if let movieList = movieList {
            if searchText.count > 1 {
                filteredMovieListArray = movieList.search.filter { $0.title.localizedCaseInsensitiveContains(searchText)}
            }
            else {
                filteredMovieListArray = movieList.search
            }
            print("Filtered Array : ", filteredMovieListArray)
            DispatchQueue.main.async {
                self.movieListCollectionView.reloadData()
            }
        }
    }

}

// CollectionView delegate methods
extension MovieListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredMovieListArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.movieListCellIdentifier, for: indexPath as IndexPath) as? MovieListCollectionCell
            else { return UICollectionViewCell()}
        cell.updateUI(search: filteredMovieListArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let movieDetailView = self.storyboard?.instantiateViewController(withIdentifier: Constants.movieDetailViewIdentifier) as? MovieDetailViewController {
            movieDetailView.imdbID = filteredMovieListArray[indexPath.row].imdbID
            navigationController?.pushViewController(movieDetailView, animated: true)
        }
    }
    
}

// Search Bar Delegate methods
extension MovieListViewController: UISearchBarDelegate {
    
    // Automatic search, user no need to tap on search bar to display the filtered movies list
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        displayMovieList(searchText: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
    }
}

extension MovieListViewController: MovieListViewModelDelegate {
    
    // Got response from API
    func getResponse(result: Codable?, error: Error?) {
        self.hideActivityIndicator()
        if error == nil, let result = result as? MovieList {
            print("Response : ", result)
            movieList = result
            filteredMovieListArray = result.search
            movieListCollectionView.reloadData()
        }
    }
}

