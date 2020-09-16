//
//  ViewController.swift
//  TMDB
//
//  Created by MG on 15.09.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet private weak var pageScrollView: UIScrollView!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    private var screens = [UIView]()
    private let numberTopRated = 10 // 1...10
    private var topRatedMovies = [Movie]()
    private var topRatedMovieViews = [TopRatedMovieView]()
    
    private var storiesPage: StoriePage?
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageScrollView.delegate = self
        getTopRatedMoviesFromServer()
    }
    
    //MARK: - UIScrollViewDelegate
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if scrollView == pageScrollView {
            let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
            pageControl.currentPage = Int(pageNumber)
            
        } else if let storiesPage = storiesPage {
            let storiesPageNumber = storiesPage.scrollView.contentOffset.x / scrollView.frame.size.width
            self.storiesPage?.pageControl.currentPage = Int(storiesPageNumber)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        pageScrollView = setupScrollView(pageScrollView, with: screens)
    }
}

//MARK: - Private

private extension ViewController {
    
    func createPages() {
        
        let storiesPage = StoriePage.createView()
        storiesPage.scrollView.delegate = self
        storiesPage.pageControl.numberOfPages = numberTopRated
        screens.append(storiesPage)
        
        let videoPade = VideoPage.createView()
        screens.append(videoPade)
        
        let favoritesPage = FavoritesPage.createView()
        screens.append(favoritesPage)
        
        for i in 0..<numberTopRated {

            let view = TopRatedMovieView.createView()
            let movie = topRatedMovies[i]
            view.nameLabel.text = movie.title
            if let url = URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2" + movie.posterPath) {
                view.imageView.af.setImage(withURL: url)
            }
            topRatedMovieViews.append(view)
        }
        
        pageScrollView = setupScrollView(pageScrollView, with: screens)
        storiesPage.scrollView = setupScrollView(storiesPage.scrollView, with: topRatedMovieViews)
        self.storiesPage = storiesPage
    }
    
    func setupScrollView(_ scrolView: UIScrollView, with pages: [UIView]) -> UIScrollView {
        scrolView.contentSize = CGSize(width: view.frame.width * CGFloat(pages.count), height: 1.0)
        scrolView.isPagingEnabled = true
        
        for i in 0 ..< pages.count {
            pages[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: scrolView.frame.height)
            scrolView.addSubview(pages[i])
        }
        return scrolView
    }
    
    func getTopRatedMoviesFromServer() {
        
        ServerManager.getTopRatedMovies(page: 1) { (topRatedMovies) in
            self.topRatedMovies = topRatedMovies
            self.createPages()
        }
    }
}

