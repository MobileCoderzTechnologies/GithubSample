//
//  CoreDataManager.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 18/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit
import SwiftyJSON
import CoreData

class CoreDataManager: NSObject {
    
    class func insertUsers(users:[JSON]?,searchName:String) {
        if let users = users {
            for user in users {
                CoreDataManager.addUser(user: user, searchName: searchName)
            }
        }
        CoreDataStack.sharedManager.saveMainContext()
    }
    
    class func addUser(user:JSON,searchName:String) {
        if CoreDataManager.isUserExists(id: user["id"].intValue) {
            return
        }
        let userModel = NSEntityDescription.insertNewObject(forEntityName: "UserModel", into: CoreDataStack.sharedManager.managedObjectContext) as! UserModel
        userModel.searchName = searchName
        userModel.loginName = user["login"].stringValue
        userModel.avatar = user["avatar_url"].stringValue
        userModel.id = user["id"].int64Value
        userModel.name = user["name"].stringValue
        userModel.company = user["company"].stringValue
        userModel.location = user["location"].stringValue
        userModel.bio = user["bio"].stringValue
        userModel.publicRepos = user["public_repos"].int16Value
        userModel.publicGist = user["public_gists"].int16Value
        userModel.followers = user["followers"].int64Value
        userModel.following = user["following"].int64Value
        userModel.htmlUrl = user["html_url"].stringValue
        if let date = Date.makeDate(dateString: user["updated_at"].stringValue) {
            userModel.lastUpdated = date as NSDate
        }
    }
    
    class func isUserExists(id:Int) -> Bool {
        let fetchRequest:NSFetchRequest<UserModel> = UserModel.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        do {
            let count = try CoreDataStack.sharedManager.managedObjectContext.count(for: fetchRequest)
            if count > 0 {
                return true
            }
            return false
        } catch {
            print(error.localizedDescription)
        }
        return false
    }
    
    class func fetchUsers(searchName:String) -> [User]?{
        let fetchRequest:NSFetchRequest<UserModel> = UserModel.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "searchName == %@", searchName)
        do {
            let usersCoreData = try CoreDataStack.sharedManager.managedObjectContext.fetch(fetchRequest) 
            if usersCoreData.count > 0 {
                var users = [User]()
                for user in usersCoreData {
                    users.append(User(userModel: user))
                }
                return users
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
