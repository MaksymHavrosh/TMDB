//
//  ViewController.swift
//  TMDB
//
//  Created by MG on 15.09.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet private weak var scrollView: UIScrollView!
    
    private var screens = [UIView]()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        createPages()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupSlideScrollView(with: screens)
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
        
        setupSlideScrollView(with: screens)
    }
    
    func setupSlideScrollView(with pages: [UIView]) {
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(pages.count), height: scrollView.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< pages.count {
            pages[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(pages[i])
        }
    }
    
}

