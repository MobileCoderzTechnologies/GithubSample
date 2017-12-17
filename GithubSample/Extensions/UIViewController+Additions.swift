//
//  UIViewController+Additions.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 16/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit
import Toast_Swift
import MBProgressHUD

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
    
    func showLoader() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func hideLoader() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    /**
     shows activity controller with supplied items. at least one type of item must be supplied
     
     - parameter image:      image to be shared
     - parameter text:       text to be shared
     - parameter url:        url to be shared
     - parameter activities: array of UIActivity which you want to show in controller. nil value will show every available active by default
     */
    
    func showActivityController(_ image: UIImage?, text: String?, url: String?, activities: [UIActivity]? = nil) {
        
        var array = [AnyObject]()
        
        if image != nil {
            array.append(image!)
        }
        if text != nil {
            array.append(text! as AnyObject)
        }
        if url != nil {
            array.append(URL(string: url!)! as AnyObject)
        }
        assert(array.count != 0, "Please specify at least element to share among image, text or url")
        
        let activityController = UIActivityViewController(activityItems: array, applicationActivities: activities)
        present(activityController, animated: true, completion: nil)
    }
    
}
