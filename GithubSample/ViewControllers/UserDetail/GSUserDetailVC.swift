//
//  GSUserDetailVC.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 17/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit

class GSUserDetailVC: UIViewController {

    enum UserDetailOptions: Int {
        case profileHeader
        case profileOverview
        case bio
    }
    
    var loginName:String!
    var user:User?
    
    @IBOutlet weak var userDetailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.fetchUserDetails(loginName: loginName)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK:- Private Methods
    private func setup() {
        self.title = self.loginName
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        navigationBar?.shadowImage = UIImage()
        
        self.userDetailTableView.register(UINib(nibName: Constants.CellIdentifier.profileHeader, bundle: nil), forCellReuseIdentifier: Constants.CellIdentifier.profileHeader)
        self.userDetailTableView.register(UINib(nibName: Constants.CellIdentifier.profileOverview, bundle: nil), forCellReuseIdentifier: Constants.CellIdentifier.profileOverview)
        self.userDetailTableView.register(UINib(nibName: Constants.CellIdentifier.bio, bundle: nil), forCellReuseIdentifier: Constants.CellIdentifier.bio)
    }
    
    private func fetchUserDetails(loginName:String) {
        self.showLoader()
        User.fetchUserDetails(loginName: loginName) { (user:User?, error:NSError?) in
            self.hideLoader()
            if error != nil {
                self.showToast(message: error!.localizedDescription)
                return
            }
            if let user = user {
                self.user = user
                DispatchQueue.main.async {
                    self.userDetailTableView.reloadData()
                }
            }
        }
    }
    
    @objc func shareUserProfile() {
        self.showActivityController(nil, text: "Find out more of this user \(user!.htmlUrl)", url: nil, activities: nil)
    }
    
    func goToFollowersList() {
        let followerListVC = UIStoryboard.searchStoryBoard().instantiateViewController(type: GSFollowersListVC.self)!
        followerListVC.user = user
        self.navigationController?.pushViewController(followerListVC, animated: true)
    }
}
