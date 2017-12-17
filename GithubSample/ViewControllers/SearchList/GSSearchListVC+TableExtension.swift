//
//  GSSearchListVC+TableExtension.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 16/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit
import SDWebImage

extension GSSearchListVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GSSearchCell") as! GSSearchCell
        let user = users[indexPath.row]
        cell.userLoginNameLabel.text = user.loginName
        cell.userImageView.sd_setShowActivityIndicatorView(true)
        cell.userImageView.sd_setIndicatorStyle(.gray)
        cell.userImageView.sd_setImage(with: URL(string:user.avatar), placeholderImage: UIImage(named: "placeHolder"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.users.count - 1 {
            if total != self.users.count {
                loadMore()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userDetailVC = UIStoryboard.searchStoryBoard().instantiateViewController(type: GSUserDetailVC.self)!
        userDetailVC.loginName = users[indexPath.row].loginName
        self.navigationController?.pushViewController(userDetailVC, animated: true)
    }
    
    
}
