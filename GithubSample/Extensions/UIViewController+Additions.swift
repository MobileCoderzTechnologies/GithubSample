//
//  UIViewController+Additions.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 16/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit
import Toast_Swift

extension UIViewController {
    func setupLoadingMoreOnTable(tableView:UITableView) {
        let footer = Bundle.main.loadNibNamed("GSLoadMoreView", owner: nil, options: nil)?[0] as? GSLoadMoreView
        footer!.frame = CGRect(x:0, y:0, width:tableView.frame.size.width,height:44)
        footer?.layoutIfNeeded();
        footer?.activityIndicator.startAnimating();
        tableView.tableFooterView = footer;
    }
    
    func showToast(message:String) {
        self.view.makeToast(message)
    }
    
}
