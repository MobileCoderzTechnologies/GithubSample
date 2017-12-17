//
//  GSProfileOverviewTableCell.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 17/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit

class GSProfileOverviewTableCell: UITableViewCell {
    
    private enum ViewTappedOptions:Int {
        case followers = 1
        case following
        case publicGists

    }
    
    @IBOutlet weak var publicReposLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersView: GSProfileOverviewSubview!
    @IBOutlet weak var publicReposView: GSProfileOverviewSubview!
    @IBOutlet weak var followingView: GSProfileOverviewSubview!
    @IBOutlet weak var outerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.outerView.layer.cornerRadius = 5.0
        self.outerView.clipsToBounds = true
        followersView.delegate = self
        followingView.delegate = self
        publicReposView.delegate = self
        followersView.tag = 1
        followingView.tag = 2
        publicReposView.tag = 3
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(user:User) {
        self.followersLabel.text = "\(user.followers)"
        self.followingLabel.text = "\(user.following)"
        self.publicReposLabel.text = "\(user.publicRepos)"
    }
    
}

extension GSProfileOverviewTableCell : GSProfileOverviewSubviewDelegate {
    
    func viewTapped(tag: Int) {
        let options = ViewTappedOptions(rawValue: tag)!
        switch options {
        case .followers:
            print("Followers Tapped")
        case .following:
            print("following Tapped")
        case .publicGists:
            print("publicGists Tapped")
        }
    }
    
}
