//
//  GSPlaceholderView.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 17/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit

class GSPlaceholderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    class func loadPlaceHolderView() ->  GSPlaceholderView {
        guard let instance = Bundle.main.loadNibNamed("GSPlaceholderView", owner: self)?.first as? GSPlaceholderView else {
            fatalError("Could not instantiate from nib: GSPlaceholderView")
        }
        return instance
    }

}
