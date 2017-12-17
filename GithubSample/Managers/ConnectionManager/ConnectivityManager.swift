//
//  ConnectivityManager.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 18/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit
import Alamofire

class ConnectivityManager: NSObject {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
