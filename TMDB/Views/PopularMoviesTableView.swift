//
//  PopularMoviesTableView.swift
//  TMDB
//
//  Created by MG on 15.09.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit
import AlamofireImage

class PopularMoviesTableView: UITableView {
    
    private var page = 1
    private var movies = [Movie]()
    private let heigthForRow = CGFloat(100)
    
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

extension PopularMoviesTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard indexPath.row == movies.count - 1 else { return }
        self.page += 1
        getPopularMoviesFromServer()
    }
}

//MARK: - UITableViewDataSource

extension PopularMoviesTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        heigthForRow
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        heigthForRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PopularMovieTableViewCell.createCell()
        let movie = movies[indexPath.row]
        cell.nameLabel.text = movie.title
        if let url = URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2" + movie.posterPath) {
            cell.cellImageView.af.setImage(withURL: url)
        }
        
        return cell
    }
}

//MARK: - Private

private extension PopularMoviesTableView {
    
    func getPopularMoviesFromServer() {
        
        ServerManager.getPopularMovies(page: page) { (movies) in
            self.movies.append(contentsOf: movies)
            self.reloadData()
        }
    }
}
