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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }

    func setup() {
        searchUsersTableView.register(UINib(nibName: "GSSearchCell", bundle: nil), forCellReuseIdentifier: "GSSearchCell")
        let titleImageView = UIImageView(image: UIImage(named:"githubLogo"))
        titleImageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = titleImageView
    }
    
    func fetchUsers(searchString:String,pageNo:Int) {
        isLoading = true
        User.fetchUserList(searchString: searchString, pageNo: pageNo) { (users:[User]?, total:Int, error:NSError?) in
            self.isLoading = false
            self.searchUsersTableView.tableFooterView = nil
            if error != nil {
                self.showToast(message: error!.localizedDescription)
                return
            }
            if let users = users {
                self.users = self.users + users
                self.total = total
                DispatchQueue.main.async {
                    self.searchUsersTableView.reloadData()
                }
            }
        }
    }
    
    func loadMore() {
        if total == self.users.count || isLoading {return}
        pageNo += 1
        print(pageNo)
        self.setupLoadingMoreOnTable(tableView: self.searchUsersTableView)
        self.fetchUsers(searchString: userSearchBar.text!, pageNo: pageNo)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
