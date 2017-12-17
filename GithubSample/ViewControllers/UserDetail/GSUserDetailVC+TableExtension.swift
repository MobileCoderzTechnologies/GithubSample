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
        let option = UserDetailOptions(rawValue: indexPath.row)!
        
        switch option {
            
        case .profileHeader:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier.profileHeader) as! GSProfileHeaderTableCell
            if let user = self.user {
                cell.setup(user: user)
            }
            cell.shareButton.addTarget(self, action: #selector(shareUserProfile), for: .touchUpInside)
            return cell
            
        case .profileOverview:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier.profileOverview) as! GSProfileOverviewTableCell
            cell.delegate = self
            if let user = self.user {
                cell.setup(user: user)
            }
            return cell
            
        case .bio:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier.bio) as! GSBioTableCell
            if let user = self.user {
                cell.setup(user: user)
            }
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let option = UserDetailOptions(rawValue: indexPath.row)!
        if option == .bio {
            if (user?.bio.isEmpty)! {return 0}
            return UITableViewAutomaticDimension
        }
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
}

extension GSUserDetailVC:GSProfileOverviewCellDelegate {
    
    func headerViewTapped(tappedView: ViewTappedOptions) {
        switch tappedView {
        case .followers:
            self.goToFollowersList()
        case .following:
            break
        case .publicGists:
            break
        }
    }
    
}
