//
//  VideoPage.swift
//  TMDB
//
//  Created by MG on 16.09.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class VideoPage: UIView {
    
    class func createView() -> VideoPage {
        let nib = UINib(nibName: "VideoPage", bundle: nil)
        let videoPage = nib.instantiate(withOwner: self, options: nil).first as! VideoPage
        return videoPage
    }

}
