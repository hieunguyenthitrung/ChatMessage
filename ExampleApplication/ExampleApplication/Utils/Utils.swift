//
//  Utils.swift
//  ExampleApplication
//
//  Created by Hieu Nguyen on 11/2/20.
//  Copyright © 2020 Hieu Nguyen Thi Trung. All rights reserved.
//

import UIKit
import Foundation
import Photos

class Utils: NSObject {
    static func compareTodayAndDate(_ date : String) -> Int{
        let dateformat = DateFormatter()
        dateformat.dateFormat = "yyyy-MM-dd";
        let date2 : Date = dateformat.date(from: date)!
        
        let secondsBetween : TimeInterval = date2.timeIntervalSince(Date())
        let numberOfDays : Int = Int(secondsBetween / 86400)
        return numberOfDays
    }

    static func convertStringDateToDateName(_ stringDate : String) -> String{
        
        let f:DateFormatter = DateFormatter()
        f.timeZone = TimeZone.autoupdatingCurrent
        f.dateFormat = "yyyyMMddHHmmss"
        
        let now = f.string(from: Date())
        let startDate = f.date(from: stringDate)
        let endDate = f.date(from: now)
        let calendar = Calendar.current
        
        let dateComponents = (calendar as NSCalendar).components([.month, .day, .hour, .minute, .second, .weekOfYear, .year], from: startDate!, to: endDate!, options:[])
        let weeks : Int = abs(dateComponents.weekOfYear!)
        let days : Int = abs(dateComponents.day!)
        let years : Int = abs(dateComponents.year!)
        let months: Int = abs(dateComponents.month!)
        
        if (years > 0) {
            if (years > 1) {
                return "\(years) Years Ago"
            } else {
                return "\(years) Year Ago"
            }
        }else{
            if (months > 0) {
                if (days > 1) {
                    return "\(months) Months Ago"
                } else {
                    return "\(months) Month Ago"
                }
            }else{
                
                if(weeks > 0){
                    if (weeks > 1) {
                        return "\(weeks) Weeks Ago"
                    } else {
                        return "\(weeks) Week Ago"
                    }
                }else{
                    if(days > 0){
                        if (weeks > 1) {
                            return "\(days) Days Ago"
                        } else {
                            return "\(days) Day Ago"
                        }
                    }else{
                        return "Today"
                    }
                }
            }
        }
    }
    
     static func convertDateMMMDD(_ string : String) -> String{
            let f:DateFormatter = DateFormatter()
            f.timeZone = TimeZone.autoupdatingCurrent
            let locale = "en"
            f.locale = Foundation.Locale(identifier: locale)
            f.dateFormat = "yyyyMMddHHmmss"
            var date = f.date(from: string)
            if(date == nil){
                f.dateFormat = "yyyyMMddHHmmssSSS"
                date = f.date(from: string)
            }
            var stringDate = ""
            f.dateFormat = "d MMM"
            stringDate = f.string(from: date!)
            return stringDate.uppercased()
    }
    
    static func convertDateYYYYMMMDDHHMMSS(_ string : String) -> String{
            let f:DateFormatter = DateFormatter()
            f.timeZone = TimeZone.autoupdatingCurrent
            let locale = "en"
            f.locale = Foundation.Locale(identifier: locale)
            f.dateFormat = "yyyyMMddHHmmssSSS"
            var date = f.date(from: string)
            if(date == nil){
                f.dateFormat = "yyyyMMddHHmmss"
                date = f.date(from: string)
            }
            var stringDate = ""
            f.dateFormat = "d MMM, YYYY HH:mm:ss"
            stringDate = f.string(from: date!)
            return stringDate
    }
    
    static func currentDate() -> String{
            let f:DateFormatter = DateFormatter()
            f.timeZone = TimeZone.autoupdatingCurrent
            let locale = "en"
            f.locale = Foundation.Locale(identifier: locale)
            f.dateFormat = "yyyyMMddHHmmssSSS"
            return  f.string(from: Date())
    }
    
    static func convertDateYYYYMMMDD(_ string : String) -> String{
            let f:DateFormatter = DateFormatter()
            f.timeZone = TimeZone.autoupdatingCurrent
            let locale = "en"
            f.locale = Foundation.Locale(identifier: locale)
            f.dateFormat = "yyyyMMddHHmmss"
            let date = f.date(from: string)
            var stringDate = ""
            f.dateFormat = "d MMM YYYY"
            stringDate = f.string(from: date!)
            
            return stringDate.uppercased()
    }
    
    static func getYear(_ date : Date) -> String{
        let f:DateFormatter = DateFormatter()
        f.timeZone = TimeZone.autoupdatingCurrent
        f.dateFormat = "yyyy"
        let dateString = f.string(from: date)
        return dateString
    }
    
    static func convertStringDateToDateNameForNotification(_ stringDate : String) -> String{
        
        let f:DateFormatter = DateFormatter()
        f.timeZone = TimeZone.autoupdatingCurrent
        f.dateFormat = "yyyyMMddHHmmss"
        
        let now = f.string(from: Date())
        let startDate = f.date(from: stringDate)
        let endDate = f.date(from: now)
        let calendar = Calendar.current
        
        let dateComponents = (calendar as NSCalendar).components([.month, .day, .hour, .minute, .second, .weekOfYear, .year], from: startDate!, to: endDate!, options:[])
        let weeks : Int = abs(dateComponents.weekOfYear!)
        //let days : Int = abs(dateComponents.day!)
        //let years : Int = abs(dateComponents.year!)
        let months : Int = abs(dateComponents.month!)
        let hours : Int = abs(dateComponents.hour!)
        let minutes : Int = abs(dateComponents.minute!)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let yearStart = formatter.string(from: startDate!)
        let yearEnd = formatter.string(from: endDate!)
        
        if (yearStart != yearEnd) {
            return Utils.convertDateYYYYMMMDD(stringDate)
        }else{
            if (months > 0) {
                return Utils.convertDateMMMDD(stringDate)
            }else{
                if(weeks > 0){
                    return Utils.convertDateMMMDD(stringDate)
                }else{
                    let cal = Calendar.current
                    var components = (cal as NSCalendar).components([.era, .year, .month, .day], from:Date())
                    let today = cal.date(from: components)!
                    
                    components = (cal as NSCalendar).components([.era, .year, .month, .day], from:startDate!);
                    let otherDate = cal.date(from: components)!
                    
                    if(today == otherDate) {
                        //do stuff
                        if(hours > 1){
                            let text = "\(hours)" + "Hour"
                            return  text
                        }else if(hours == 1){
                            return  "1" + "Hour"
                        }else{
                            if(minutes  > 1){
                                let text = "\(minutes)" + "Minute"
                                return text
                            }else{
                                let text = "1" + "Minute"
                                return text
                            }
                        }
                    }else{
                        return Utils.convertDateMMMDD(stringDate)
                    }
                }
                
            }
        }
        
    }
    
    static func convertStringDateToDate(_ string : String) -> Date{
        let f:DateFormatter = DateFormatter()
        f.timeZone = TimeZone.autoupdatingCurrent
        f.dateFormat = "yyyyMMddHHmmssSSS"
        let date = f.date(from: string)
        return date!
    }
    
    static func timeAgoSinceDate(_ stringDate : String) -> Bool{
        let calendar = Calendar.current
        //let unitFlags =
        let f:DateFormatter = DateFormatter()
        f.timeZone = TimeZone.autoupdatingCurrent
        f.dateFormat = "yyyyMMddHHmmssSSS"
        
        //let now = f.stringFromDate(NSDate())
        let startDate = f.date(from: stringDate)
        
        let now = Date()
        let earliest = (now as NSDate).earlierDate(startDate!)
        let latest = (earliest == now) ? startDate : now
        let components:DateComponents = (calendar as NSCalendar).components([.month, .day, .hour, .minute, .second, .weekOfYear, .year], from: earliest, to: latest!, options: [])
        
        if (components.year! >= 1){
            return false
        }else if (components.month! >= 1){
            return false
        }else if (components.weekOfYear! >= 1){
            return false
        }else if (components.day! >= 1){
            return false
        } else if (components.hour! > 4) {
            return false
        }
        return true
    }
}
