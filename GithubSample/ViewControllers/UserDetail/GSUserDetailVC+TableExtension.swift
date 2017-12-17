//
//  GSUserDetailVC+TableExtension.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 17/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit
import SDWebImage

extension GSUserDetailVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GSProfileHeaderTableCell") as! GSProfileHeaderTableCell
        return cell
    }
    
}
