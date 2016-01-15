# GiphyKit
## Just another Swift wrapper for Giphy

This is incomplete and may never be finished. It requires Alamofire and SwiftyJSON. No podspec is included yet.

## Usage

    Giphy.APIKey = "dc6zaTOxFJmzC"

    Giphy.search("cats") { gifs, error in
        print(gifs)
        print(error)
    }
