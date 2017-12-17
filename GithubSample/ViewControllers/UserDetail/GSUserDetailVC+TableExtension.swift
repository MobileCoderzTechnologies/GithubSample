//
//  GSUserDetailVC+TableExtension.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 17/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit

extension GSUserDetailVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if user == nil {
            return 0
        }
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSProfileHeaderTableCell") as! GSProfileHeaderTableCell
            if let user = self.user {
                cell.setup(user: user)
            }
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSProfileOverviewTableCell") as! GSProfileOverviewTableCell
            if let user = self.user {
                cell.setup(user: user)
            }
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GSBioTableCell") as! GSBioTableCell
            if let user = self.user {
                cell.setup(user: user)
            }
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2 {
            if (user?.bio.isEmpty)! {return 0}
            return UITableViewAutomaticDimension
        }
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
}
