//
//  API.swift
//  Peach
//
//  Created by Stephen Radford on 15/01/2016.
//  Copyright © 2016 Cocoon Development Ltd. All rights reserved.
//

import Foundation
import Alamofire

enum API: URLRequestConvertible {
    
    static var base = "http://api.giphy.com/v1"
    
    case Search(String)
    
    var method: Alamofire.Method {
        switch self {
        default:
            return .GET
        }
    }

    var URLRequest: NSMutableURLRequest {
        
        let result: (path: String, parameters: [String: AnyObject]) = {
            switch self {
            case .Search(let query):
                return ("/gifs/search", ["q": query, "api_key": Giphy.APIKey!])
            }
        }()
        
        let URL = NSURL(string: API.base)!
        let URLRequest = NSURLRequest(URL: URL.URLByAppendingPathComponent(result.path))
        let encoding = Alamofire.ParameterEncoding.URL
        
        return encoding.encode(URLRequest, parameters: result.parameters).0
        
    }
    
    
}