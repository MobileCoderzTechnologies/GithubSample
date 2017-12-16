//
//  User.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 16/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    var loginName:String = ""
    var avatar:String = ""
    var id:Int = 0
    
    init(user:JSON) {
        self.loginName = user["login"].stringValue
        self.avatar = user["avatar_url"].stringValue
        self.id = user["id"].intValue
    }
}



