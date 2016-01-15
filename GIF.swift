//
//  GIF.swift
//  Peach
//
//  Created by Stephen Radford on 15/01/2016.
//  Copyright © 2016 Cocoon Development Ltd. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public struct GIF {

    var id: String?
    
    var bitlyURL: String?
    
    var bitlyGIFURL: String?
    
    var images: [GiphyImage] = []
    
}

extension Giphy {
    
    /**
     Search Giphy
     
     - parameter query:    The query to search the API with
     - parameter callback: Callback with array of gifs and optional NSError
     */
    public class func search(query: String, callback: ([GIF], NSError?) -> Void) {
        
        Alamofire.request(API.Search(query))
            .responseJSON { response in
                if response.result.isSuccess {
                    Swift.print(response.result.value)
                }
            }
        
    }
    
}