//
//  ReachabilityManager.swift
//  PostViewer
//
//  Created by Birani, Bhanu Prakash on 8/19/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import UIKit

class ReachabilityManager: NSObject {
    class var shared: ReachabilityManager {
        struct Static {
            static let instance: ReachabilityManager = ReachabilityManager()
        }
        return Static.instance
    }
    
    var isNetworkAvailable: Bool {
        return ReachabilityManager.checkForConnection()
    }
    
    fileprivate class func checkForConnection() -> Bool {
        let reachability = Reachability(hostname: "google.com")
        return reachability?.connection != Reachability.Connection.none
    }
}
