//
//  FavoritesPage.swift
//  TMDB
//
//  Created by MG on 16.09.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class FavoritesPage: UIView {
    
    class func createView() -> FavoritesPage {
        let nib = UINib(nibName: "FavoritesPage", bundle: nil)
        let favouritesPage = nib.instantiate(withOwner: self, options: nil).first as! FavoritesPage
        return favouritesPage
    }

}
