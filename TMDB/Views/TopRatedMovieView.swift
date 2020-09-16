//
//  TopRatedMovieView.swift
//  TMDB
//
//  Created by MG on 16.09.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class TopRatedMovieView: UIView {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    class func createView() -> TopRatedMovieView {
        let nib = UINib(nibName: "TopRatedMovieView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! TopRatedMovieView
        
        return view
    }
    
}
