//
//  LinkCrawler.swift
//  Pods
//
//  Created by Avinash Jain on 6/15/16.
//
//

import Foundation


public class LinkCrawler : NSObject {
    
    var url : String = ""
    
    public init (url: String) {
        self.url = url
        
    }
    
    public func getData(completionHandler: (data: [String:String]) -> ()) {
            
        var json = [String:String]()
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: url)!, completionHandler: { (data, response, error) -> Void in
            
            do {
                json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! [String:String]
                // Do Stuff
                
          
                
                
            } catch {
                // handle error
                json =  ["imgurl": "Error", "title": "Error", "decrip": "Error"] as [String: String]
                
                
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                
                completionHandler(data: json)
                // code here
            })
            
            
            
            })
        task.resume()
        
        }
    
        
}

