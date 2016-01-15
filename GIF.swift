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
                    if let value = response.result.value {
                        let json = JSON(value)
                        if let data = json["data"].array {
                            let gifs = data.map(parseGIF)
                            callback(gifs, response.result.error)
                            return
                        }
                    }
                }
                
                callback([], response.result.error)
            }
        
    }
    
    /**
     Parse JSON to Giphy GIF
     
     - parameter json: Raw JSON
     
     - returns: A shiny shiny GIF
     */
    internal class func parseGIF(json: JSON) -> GIF {
        var gif = GIF()
        gif.id = json["id"].string
        gif.bitlyURL = json["bitly_url"].string
        gif.bitlyGIFURL = json["bitly_gif_url"].string
        if let images = json["images"].dictionary {
            if let image = images["original"]?.dictionary {
                
                var img = GiphyImage()
                img.height = image["height"]?.string
                img.width = image["width"]?.string
                img.mp4 = image["mp4"]?.string
                img.mp4Size = image["mp4_size"]?.string
                img.size = image["size"]?.string
                img.url = image["url"]?.string
                img.webp = image["webp"]?.string
                img.webpSize = image["webp_size"]?.string
                gif.images = [img]
                
            }
        }
        return gif
    }
    
}