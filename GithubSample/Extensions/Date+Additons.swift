//
//  Date+Additons.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 17/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import Foundation
extension Date {
    public static func dateFormatYYYYMMDDTHHMMSSZ() ->String {
        return "yyyy-MM-dd'T'HH:mm:ssZ"
    }
    
    public static func dateFormatDDMMMYYYYHHMMAA() ->String {
        return "dd MMM yyyy hh:mm:ss aa"
    }
    
    static func makeDateStringUTC(date:Date)-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormatDDMMMYYYYHHMMAA()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        return dateFormatter.string(from: date)
    }
    
    static func makeDateStringLocal(date:Date)-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.amSymbol = "am"
        dateFormatter.pmSymbol = "pm"
        dateFormatter.dateFormat = dateFormatDDMMMYYYYHHMMAA()
        dateFormatter.timeZone = NSTimeZone.local
        return dateFormatter.string(from: date)
    }
    
    static func makeDate(dateString:String)-> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.amSymbol = "am"
        dateFormatter.pmSymbol = "pm"
        dateFormatter.dateFormat = dateFormatYYYYMMDDTHHMMSSZ()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        return dateFormatter.date(from: dateString)
    }
    
}
