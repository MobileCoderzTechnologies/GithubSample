//
//  GSFollowersListVC.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 18/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit

class GSFollowersListVC: UIViewController {

    @IBOutlet weak var followersTableView: UITableView!
    var user:User!
    var followers = [User]()
    var placeHolderView:GSPlaceholderView?

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.fetchFollowers()
    }
    
    //MARK:- Private Methods
    private func setup() {
        self.title = "Followers"
        self.followersTableView.register(UINib(nibName: Constants.CellIdentifier.search, bundle: nil), forCellReuseIdentifier: Constants.CellIdentifier.search)
        placeHolderView = GSPlaceholderView.loadPlaceHolderView()
        placeHolderView?.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
        placeHolderView?.placeholderLabel.text = "No Followers Found"
        placeHolderView?.center = self.view.center
        self.view.addSubview(placeHolderView!)
    }
    
    private func fetchFollowers() {
        self.showLoader()
        User.fetchFollowerList(loginName: user.loginName) { (followers:[User]?, error:NSError?) in
            self.hideLoader()
            if let followers = followers {
                self.followers = followers
                self.placeHolderView?.isHidden = self.followers.count == 0 ? false : true
                if self.followers.count > 0 {
                    DispatchQueue.main.async {
                        self.followersTableView.reloadData()
                    }
                }
            }
        }
    }

}
