//
//  UIStoryboard+Additions.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 17/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    func instantiateViewController<T:UIViewController>(type: T.Type) -> T? {
        var fullName: String = NSStringFromClass(T.self)
        if let range = fullName.range(of:".", options:.backwards, range:nil, locale: nil){
            fullName = String(fullName.suffix(from: range.upperBound))
        }
        return self.instantiateViewController(withIdentifier:fullName) as? T
    }
    
    class func searchStoryBoard()->UIStoryboard{
        return UIStoryboard(name: "Search", bundle: nil)
    }
}
