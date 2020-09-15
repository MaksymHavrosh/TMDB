//
//  StorieTableViewCell.swift
//  TMDB
//
//  Created by MG on 15.09.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class StorieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    class func createCell() -> StorieTableViewCell {
        let nib = UINib(nibName: "StorieTableViewCell", bundle: nil)
        let cell = nib.instantiate(withOwner: self, options: nil).first as! StorieTableViewCell
        
        return cell
    }

}
