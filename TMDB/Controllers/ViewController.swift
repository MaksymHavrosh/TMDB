//
//  ViewController.swift
//  TMDB
//
//  Created by MG on 15.09.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet private weak var popularScrollView: UIScrollView!
    @IBOutlet private weak var topRatedScrollView: UIScrollView!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    private var screens = [UIView]()
    private let numberTopRated = 5
    private var topRatedMovies = [Movie]()
    private var topRatedMovieViews = [TopRatedMovieView]()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popularScrollView.delegate = self
        topRatedScrollView.delegate = self
        getPopularMoviesFromServer()
    }
    
    //MARK: - UIScrollViewDelegate
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        popularScrollView = setupScrollView(popularScrollView, with: screens)
        topRatedScrollView = setupScrollView(topRatedScrollView, with: topRatedMovieViews)
    }
}

//MARK: - Private

private extension ViewController {
    
    func createPages() {
        
        let storieTableView = StoriesTableView()
        screens.append(storieTableView)
        
        let defaultVideoView = UIView()
        screens.append(defaultVideoView)
        defaultVideoView.backgroundColor = .darkGray
        
        let defaultFavouritesView = UIView()
        screens.append(defaultFavouritesView)
        defaultFavouritesView.backgroundColor = .lightGray
        
        for i in 0..<numberTopRated {
            let view = TopRatedMovieView.createView()
            view.nameLabel.text = topRatedMovies[i].title
            topRatedMovieViews.append(view)
        }
        
        popularScrollView = setupScrollView(popularScrollView, with: screens)
        topRatedScrollView = setupScrollView(topRatedScrollView, with: topRatedMovieViews)
    }
    
    func setupScrollView(_ scrolView: UIScrollView ,with pages: [UIView]) -> UIScrollView {
        scrolView.contentSize = CGSize(width: view.frame.width * CGFloat(pages.count), height: scrolView.frame.height)
        scrolView.isPagingEnabled = true
        
        for i in 0 ..< pages.count {
            pages[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrolView.addSubview(pages[i])
        }
        return scrolView
    }
    
    func getPopularMoviesFromServer() {
        
        ServerManager.getTopRatedMovies(page: 1) { (topRatedMovies) in
            self.topRatedMovies = topRatedMovies
            self.createPages()
        }
    }
}

