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
        fetchUserListFromServer(searchString: searchString, pageNo: pageNo) { (users:[User]?, total:Int, error:NSError?) in
            if error != nil {
                completionHandler(nil, total, error)
                return
            }
            completionHandler(users, total, nil)
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
}

extension User {
    
    fileprivate static func fetchUserListFromServer(searchString:String,pageNo:Int, completionHandler:@escaping(_ users:[User]?, _ total:Int, _ error:NSError?)->Void) {
        
        APIManager.apiGet(serviceName: Constants.baseUrl+"search/users?q=\(searchString)&page=\(pageNo)", parameters: nil) { (response, error) in
            if error != nil {
                completionHandler(nil, 0, error)
                return
            }
            guard let response = response else {return}
            print(response)
            if !response["message"].stringValue.isEmpty {
                let error = NSError(domain: "",code:429,userInfo:
                    [NSLocalizedDescriptionKey:response["message"].stringValue,
                     NSLocalizedFailureReasonErrorKey:response["message"].stringValue,
                     NSLocalizedRecoverySuggestionErrorKey:response["message"].stringValue])
                completionHandler(nil, 0, error)
            } else {
                var users = [User]()
                for user in response["items"].arrayValue {
                    users.append(User(user: user))
                }
                completionHandler(users, response["total_count"].intValue, nil)
            }
            
        }
    }
    
    fileprivate static func fetchUserListFromDB(searchString:String,completionHandler:@escaping(_ users:[User]?,_ error:NSError?)->Void) {
        
    }
    
    fileprivate static func fetchUserDetailsFromServer(loginName:String, completionHandler:@escaping(_ users:User?, _ error:NSError?)->Void) {
        APIManager.apiGet(serviceName: Constants.baseUrl+"users/\(loginName)", parameters: nil) { (response, error) in
            if error != nil {
                completionHandler(nil, error)
                return
            }
            guard let response = response else {return}
            print(response)
            let user = User(user: response)
            completionHandler(user, nil)
        }
    }
    
}
