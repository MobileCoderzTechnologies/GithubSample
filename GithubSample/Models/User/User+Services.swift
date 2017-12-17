//
//  User+Services.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 16/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import Foundation

//MARK:- All the operations related to User
extension User {
    
    static func fetchUserList(searchString:String, pageNo:Int, completionHandler:@escaping(_ users:[User]?, _ total:Int, _ error:NSError?)->Void) {
        
        if ConnectivityManager.isConnectedToInternet() {
            fetchUserListFromServer(searchString: searchString, pageNo: pageNo) { (users:[User]?, total:Int, error:NSError?) in
                if error != nil {
                    completionHandler(nil, total, error)
                    return
                }
                completionHandler(users, total, nil)
            }
        } else {
            fetchUserListFromDB(searchString: searchString) { (users:[User]?, error:NSError?) in
                if error != nil {
                    completionHandler(nil, 0, error)
                    return
                }
                completionHandler(users, users!.count, nil)
            }
        }
    }
    
    static func fetchUserDetails(loginName:String,completionHandler:@escaping(_ users:User?, _ error:NSError?)->Void) {
        fetchUserDetailsFromServer(loginName: loginName) { (user:User?, error:NSError?) in
            if error != nil {
                completionHandler(nil, error)
                return
            }
            completionHandler(user, nil)
        }
    }
    
    static func fetchFollowerList(loginName:String, completionHandler:@escaping(_ followers:[User]?,  _ error:NSError?)->Void) {
        fetchFollowersListFromServer(loginName: loginName) { (users:[User]?, error:NSError?) in
            if error != nil {
                completionHandler(nil, error)
                return
            }
            completionHandler(users, nil)
        }
    }
    
    
}

//MARK:-  Methods which get the actual data from server/core data
extension User {
    
    fileprivate static func fetchUserListFromServer(searchString:String,pageNo:Int, completionHandler:@escaping(_ users:[User]?, _ total:Int, _ error:NSError?)->Void) {
        
        APIManager.apiGet(serviceName: Constants.baseUrl+"search/users?q=\(searchString)&page=\(pageNo)", parameters: nil) { (response, error) in
            if error != nil {
                completionHandler(nil, 0, error)
                return
            }
            guard let response = response else {return}
            if !response["message"].stringValue.isEmpty {
                let error = NSError(domain: "",code:429,userInfo:
                    [NSLocalizedDescriptionKey:response["message"].stringValue,
                     NSLocalizedFailureReasonErrorKey:response["message"].stringValue,
                     NSLocalizedRecoverySuggestionErrorKey:response["message"].stringValue])
                completionHandler(nil, 0, error)
            } else {
                let usersArray = response["items"].arrayValue
                var users = [User]()
                CoreDataManager.insertUsers(users: usersArray, searchName: searchString)
                for user in usersArray {
                    users.append(User(user: user))
                }
                completionHandler(users, response["total_count"].intValue, nil)
            }
            
        }
    }
    
    
    fileprivate static func fetchUserListFromDB(searchString:String,completionHandler:@escaping(_ users:[User]?,_ error:NSError?)->Void) {
        let users = CoreDataManager.fetchUsers(searchName: searchString)
        if let users = users {
            if users.count > 0 {
                completionHandler(users, nil)
            }
        } else {
            let error = NSError(domain: "",code:429,userInfo:
                [NSLocalizedDescriptionKey:"No Results Found",
                 NSLocalizedFailureReasonErrorKey:"No Results Found",
                 NSLocalizedRecoverySuggestionErrorKey:"No Results Found"])
            completionHandler(nil,error)
        }
    }
    
    fileprivate static func fetchUserDetailsFromServer(loginName:String, completionHandler:@escaping(_ users:User?, _ error:NSError?)->Void) {
        APIManager.apiGet(serviceName: Constants.baseUrl+"users/\(loginName)", parameters: nil) { (response, error) in
            if error != nil {
                completionHandler(nil, error)
                return
            }
            guard let response = response else {return}
            let user = User(user: response)
            completionHandler(user, nil)
        }
    }
    
    fileprivate static func fetchFollowersListFromServer(loginName:String, completionHandler:@escaping(_ followers:[User]?, _ error:NSError?)->Void) {
        
        APIManager.apiGet(serviceName: Constants.baseUrl+"users/\(loginName)/followers", parameters: nil) { (response, error) in
            if error != nil {
                completionHandler(nil, error)
                return
            }
            guard let response = response else {return}
            var followers = [User]()
            for follower in response.arrayValue {
                let user = User(user: follower)
                followers.append(user)
            }
            completionHandler(followers, error)
        }
    }
    
}
