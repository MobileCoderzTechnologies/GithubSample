//
//  UserModel+CoreDataProperties.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 18/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//
//

import Foundation
import CoreData


extension UserModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserModel> {
        return NSFetchRequest<UserModel>(entityName: "UserModel")
    }

    @NSManaged public var id: Int64
    @NSManaged public var loginName: String?
    @NSManaged public var avatar: String?
    @NSManaged public var name: String?
    @NSManaged public var bio: String?
    @NSManaged public var lastUpdated: NSDate?
    @NSManaged public var location: String?
    @NSManaged public var followers: Int64
    @NSManaged public var following: Int64
    @NSManaged public var publicRepos: Int16
    @NSManaged public var publicGist: Int16
    @NSManaged public var company: String?
    @NSManaged public var htmlUrl: String?
    @NSManaged public var searchName: String?

}
