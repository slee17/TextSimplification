//
//  Getter.swift
//  HMC Word Scroll
//
//  Created by Rachel Lee on 11/19/15.
//  Copyright © 2015 HMC LAPDOG. All rights reserved.
//

import Foundation

func httpGet(request: NSURLRequest!, callback: (String, String?) -> Void) {
    let session = NSURLSession.sharedSession()
    let task = session.dataTaskWithRequest(request){
        (data, response, error) -> Void in
        if error != nil {
            callback("", error!.localizedDescription)
        } else {
            let result = NSString(data: data!, encoding:
                NSASCIIStringEncoding)!
            callback(result as String, nil)
        }
    }
    task.resume()
}

func getter(){
    var request = NSMutableURLRequest(URL: NSURL(string: "http://www.google.com")!)
    httpGet(request){
        (data, error) -> Void in
        if error != nil {
            print(error)
        } else {
            print(data)
        }
    }
}
