//
//  User.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 16/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import Foundation

class User {
    var loginName:String = ""
    var avatar:String = ""
    var id:String = ""
    
    enum CodingKeys: String, CodingKey {
        case loginName = "login"
        case avatar = "avatar_url"
        case id
    }
}

//MARK:- All the operations related to User
extension User {
    static func fetchUserList(searchString:String,completionHandler:@escaping(_ users:[User]?,_ error:NSError?)->Void) {
    }
}
