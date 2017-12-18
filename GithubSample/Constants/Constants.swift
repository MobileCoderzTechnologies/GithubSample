//
//  Constants.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 16/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let baseUrl = ConfigurationManager.shared().applicationEndPoint()
    static let placeHolderImage = UIImage(named: "placeholder")
    struct CellIdentifier {
        static let search = "GSSearchCell"
        static let profileHeader  = "GSProfileHeaderTableCell"
        static let profileOverview  = "GSProfileOverviewTableCell"
        static let bio  = "GSBioTableCell"
    }
}
