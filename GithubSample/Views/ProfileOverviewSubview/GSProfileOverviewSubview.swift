//
//  GSProfileOverviewSubview.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 17/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit

protocol GSProfileOverviewSubviewDelegate {
    func viewTapped(tag:Int)
}

class GSProfileOverviewSubview: UIView {
    
    var delegate:GSProfileOverviewSubviewDelegate?
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let delegate = delegate {
            delegate.viewTapped(tag: self.tag)
        }
    }

}
