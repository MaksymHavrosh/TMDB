//
//  PopularMovieTableViewCell.swift
//  TMDB
//
//  Created by MG on 15.09.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class PopularMovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    class func createCell() -> PopularMovieTableViewCell {
        let nib = UINib(nibName: "PopularMovieTableViewCell", bundle: nil)
        let cell = nib.instantiate(withOwner: self, options: nil).first as! PopularMovieTableViewCell
        
        return cell
    }
}
