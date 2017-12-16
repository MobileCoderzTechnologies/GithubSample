//
//  APIManager.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 16/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {
    
//    class func apiGet(serviceName:String,parameters: [String:Any]?, completionHandler: @escaping (JSON?, NSError?) -> ()) {
//
//        Alamofire.request(serviceName, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
//            switch(response.result) {
//            case .success(_):
//                if let data = response.result.value {
//                    let json = JSON(data)
//                    completionHandler(json,nil)
//                }
//                break
//            case .failure(_):
//                completionHandler(nil,response.result.error as NSError?)
//                break
//            }
//        }
//    }
    
}
