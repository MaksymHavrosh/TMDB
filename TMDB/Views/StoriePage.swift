//
//  StoriePage.swift
//  TMDB
//
//  Created by MG on 16.09.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class StoriePage: UIView {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: StoriesTableView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    class func createView() -> StoriePage {
        let nib = UINib(nibName: "StoriePage", bundle: nil)
        let storiePage = nib.instantiate(withOwner: self, options: nil).first as! StoriePage
        return storiePage
    }
}
