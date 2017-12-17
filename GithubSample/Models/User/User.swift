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
    var name:String = ""
    var location:String = ""
    var company:String = ""
    var email:String = ""
    var bio:String = ""
    var publicRepos:Int = 0
    var publicGists:Int = 0
    var following:Int = 0
    var followers:Int = 0
    var updatedAt:String = ""
    
    init(user:JSON) {
        self.loginName = user["login"].stringValue
        self.avatar = user["avatar_url"].stringValue
        self.id = user["id"].intValue
        self.name = user["name"].stringValue
        self.company = user["company"].stringValue
        self.location = user["location"].stringValue
        self.bio = user["bio"].stringValue
        self.publicRepos = user["public_repos"].intValue
        self.publicGists = user["public_gists"].intValue
        self.followers = user["followers"].intValue
        self.following = user["following"].intValue
        self.updatedAt = user["updated_at"].stringValue
    }
}



