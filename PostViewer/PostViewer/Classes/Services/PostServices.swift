//
//  PostListProtocol.swift
//  PostViewer
//
//  Created by Birani, Bhanu Prakash on 8/18/18.
//  Copyright © 2018 Birani, Bhanu Prakash. All rights reserved.
//

import UIKit

class PostServices: NSObject {
    
    static func getPosts(completion: @escaping (AnyObject?, Error?) -> ()) {
        
        let url = "https://jsonplaceholder.typicode.com/posts"
        
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                completion(nil, error)
            } else if let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode, let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                completion(json as AnyObject, nil)
            }
        })
        dataTask.resume()
    }
}
