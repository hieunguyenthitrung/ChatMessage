//
//  LibraryAPI.swift
//  ExampleApplication
//
//  Created by Hieu Nguyen Thi Trung on 5/24/20.
//  Copyright © 2020 Hieu Nguyen Thi Trung. All rights reserved.
//

import UIKit
import SystemConfiguration

class LibraryAPI: UIResponder {
    
    // MARK: - URL
    let KAPI_Get_Users                              = "https://api.github.com/users"
    
    //MARK: String error
    let ServerNotResponse = "Server is not responding, and try again."
    let InternetErrorText = "Please check your network, and try again."
    let Successfully = "Successfully"
    
    //1
    class var sharedInstance: LibraryAPI {
        //2
        struct Singleton {
            //3
            static let instance = LibraryAPI()
        }
        //4
        return Singleton.instance
    }
    
    override init() {
        super.init()
    }
    
    func checkInternet()->Bool{
        if Reachability.isConnectedToNetwork(){
            return true
        }else{
            return false
        }
    }
    
    func callServiceGetMethod (url : String, postCompleted : @escaping (_ data:AnyObject?,_ statusCode: Int?) -> ()){
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            let httpResponse : HTTPURLResponse? = response as? HTTPURLResponse
            if httpResponse != nil{
//                do {
//                    let jsonArray = try JSONSerialization.jsonObject(with: data!, options:[])
////                    print("Array: \(jsonArray)")
//                }
//                catch {
//                    print("Error: \(error)")
//                }
                return postCompleted(data as AnyObject?, httpResponse!.statusCode)
            }else{
                return postCompleted(nil, nil)
            }
        }).resume()
    }
    
    func checkOnlineCallServiceWithMethod( url : String, postCompleted : @escaping (_ data:AnyObject?,_ error :String) -> ()){
        if self.checkInternet() {
            self.callServiceGetMethod(url: url, postCompleted: { (data, statusCode) -> () in
                if(statusCode == 200 || statusCode == 201){// code successs
                    return postCompleted(data, self.Successfully)
                }else {
                    return postCompleted(nil, self.ServerNotResponse)
                }
            })
        }else{
            return postCompleted(nil, self.InternetErrorText)
        }
    }
    
    //====================CALL API========================
    // MARK: 1 - Get User List
    func getUsers(callBack:@escaping (_ data:AnyObject?,_ Message : String?)->Void) ->Void{
        checkOnlineCallServiceWithMethod(url: KAPI_Get_Users) { (data, error) -> () in
            return callBack(data, error)
        }
    }
    
    // MARK: 2 - Get User Information
    func getUserInformation(userURL: String, callBack:@escaping (_ data:AnyObject?,_ Message : String?)->Void) ->Void{
        checkOnlineCallServiceWithMethod(url: userURL) { (data, error) -> () in
            return callBack(data, error)
        }
    }
    
    // MARK: 2 - Get Followers List
    func getFollowers(followersURL: String, callBack:@escaping (_ data:AnyObject?,_ Message : String?)->Void) ->Void{
        checkOnlineCallServiceWithMethod(url: followersURL) { (data, error) -> () in
            return callBack(data, error)
        }
    }
}


public class Reachability {

    class func isConnectedToNetwork() -> Bool {

        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)

        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }

        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }

        /* Only Working for WIFI
        let isReachable = flags == .reachable
        let needsConnection = flags == .connectionRequired

        return isReachable && !needsConnection
        */

        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)

        return ret

    }
}
