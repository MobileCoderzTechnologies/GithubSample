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
    var htmlUrl:String = ""
    
    //Constructor for Server
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
        self.htmlUrl = user["html_url"].stringValue
    }
    
    //Constructor for local DB
    init(userModel:UserModel) {
        self.loginName = userModel.loginName!
        self.avatar = userModel.avatar!
        self.id = Int(userModel.id)
        self.name = userModel.name!
        self.company = userModel.company!
        self.location = userModel.location!
        self.bio = userModel.bio!
        self.publicRepos = Int(userModel.publicRepos)
        self.publicGists = Int(userModel.publicGist)
        self.followers = Int(userModel.followers)
        self.following = Int(userModel.following)
        self.htmlUrl = userModel.htmlUrl!
    }
}



