//
//  SearchTableViewController.swift
//  TMDB
//
//  Created by MG on 16.09.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    private var page = 1
    private var movies = [Movie]()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PopularMovieTableViewCell.createCell()
        let movie = movies[indexPath.row]
        cell.backgroundColor = .white
        cell.nameLabel.textColor = .black
        cell.nameLabel.text = movie.title
        
        return cell
    }
}

//MARK: - UISearchBarDelegate

extension SearchTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else { return }
        
        ServerManager.searchMovie(query: searchText, page: page) { (movies) in
            self.movies = movies
            self.tableView.reloadData()
        }
    }
}
