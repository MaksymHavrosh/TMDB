//
//  StoriesTableView.swift
//  TMDB
//
//  Created by MG on 15.09.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class StoriesTableView: UITableView {
    
    private var page = 1
    private var movies = [Movie]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        dataSource = self
        delegate = self
        getPopularMoviesFromServer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        dataSource = self
        delegate = self
        getPopularMoviesFromServer()
    }
}

//MARK: - UITableViewDelegate

extension StoriesTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard indexPath.row == movies.count - 1 else { return }
        self.page += 1
        getPopularMoviesFromServer()
    }
}

//MARK: - UITableViewDataSource

extension StoriesTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = StorieTableViewCell.createCell()
        let movie = movies[indexPath.row]
        cell.nameLabel.text = movie.title
        
        return cell
    }
}

//MARK: - Private

private extension StoriesTableView {
    
    func getPopularMoviesFromServer() {
        
        ServerManager.getPopularMovies(page: page) { (movies) in
            self.movies.append(contentsOf: movies)
            self.reloadData()
        }
    }
}
