//
//  GSSearchListVC.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 16/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit

class GSSearchListVC: UIViewController {

    @IBOutlet weak var userSearchBar: UISearchBar!
    @IBOutlet weak var searchUsersTableView: UITableView!
    
    var users = [User]()
    var pageNo = 1
    var total = 0
    var isLoading = false
    var placeHolderView:GSPlaceholderView?
    var searchUser:String!

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.searchUsersTableView.deselectSelectedRow(animated: true)
    }

    //MARK:- Private Methods
    private func setup() {
        searchUsersTableView.register(UINib(nibName: Constants.CellIdentifier.search, bundle: nil), forCellReuseIdentifier: Constants.CellIdentifier.search)
        let titleImageView = UIImageView(image: UIImage(named:"githubLogo"))
        titleImageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = titleImageView
        navigationController?.navigationBar.tintColor = UIColor.white

        placeHolderView = GSPlaceholderView.loadPlaceHolderView()
        placeHolderView?.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
        placeHolderView?.center = self.view.center
        self.searchUsersTableView.keyboardDismissMode = .onDrag

        self.view.addSubview(placeHolderView!)
    }
    
    func fetchUsers(searchString:String,pageNo:Int) {
        if pageNo == 1 {
            self.showLoader()
        }
        User.fetchUserList(searchString: searchString, pageNo: pageNo) { (users:[User]?, total:Int, error:NSError?) in
            self.hideLoader()
            self.isLoading = false
            if error != nil {
                self.showToast(message: error!.localizedDescription)
                self.searchUsersTableView.tableFooterView = nil
                return
            }
            if let users = users {
                self.users = self.users + users
                self.total = total
                self.placeHolderView?.isHidden = self.users.count == 0 ? false : true
                DispatchQueue.main.async {
                    self.searchUsersTableView.tableFooterView = nil
                    self.searchUsersTableView.reloadData()
                }
            }
        }
    }
    
    func loadMore() {
        if total == self.users.count || isLoading {return}
        if total > self.users.count {
            pageNo += 1
            isLoading = true
            self.setupLoadingMoreOnTable(tableView: self.searchUsersTableView)
            self.fetchUsers(searchString: searchUser, pageNo: pageNo)
        }
    }
}
