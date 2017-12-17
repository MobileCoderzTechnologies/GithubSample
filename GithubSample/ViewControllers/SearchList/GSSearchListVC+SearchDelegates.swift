//
//  GSSearchListVC+SearchDelegates.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 16/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit

extension GSSearchListVC : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        if searchBar.text!.isEmpty {
            return
        }
        self.users.removeAll()
        self.searchUsersTableView.reloadData()
        self.pageNo = 1
        self.fetchUsers(searchString: searchBar.text!, pageNo: pageNo)
    }
}
