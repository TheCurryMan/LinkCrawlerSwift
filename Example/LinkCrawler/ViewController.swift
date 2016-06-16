//
//  ViewController.swift
//  LinkCrawler
//
//  Created by Avinash Jain on 06/15/2016.
//  Copyright (c) 2016 Avinash Jain. All rights reserved.
//

import UIKit
import LinkCrawler


class ViewController: UIViewController {
    
    @IBOutlet var articleImage: UIImageView!
    @IBOutlet var articleTitle: UILabel!
    @IBOutlet var articleDescrip: UILabel!
    
    
    var imgurl : String!
    var titleHead : String!
    var descrip : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //var obj = LinkCrawler(url: "http://metadatacrawler.appspot.com/meta?url=http://www.cnn.com/2016/06/15/us/alligator-attacks-child-disney-florida/index.html", loaded: false)
       var obj = LinkCrawler(url: "http://metadatacrawler.appspot.com/meta?url=http://www.cnn.com/2016/06/15/us/alligator-attacks-child-disney-florida/index.html")
        
        obj.getData() {
            data in
            self.imgurl = data["imgurl"]
            self.titleHead = data["title"]
            self.descrip = data["description"]
            
            self.displayData()
        
        }
        
    }
    
    func displayData() {
        print("Should display")
        print(titleHead)
        articleTitle.text = titleHead
        articleDescrip.text = descrip
        articleImage.image = UIImage(data: NSData(contentsOfURL: NSURL(string: imgurl)!)!)
    
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

/* lass func getGenres(completionHandler: (genres: NSArray) -> ()) {
 ...
 let task = session.dataTaskWithURL(url) {
 data, response, error in
 ...
 resultsArray = results
 completionHandler(genres: resultsArray)
 }
 ...
 task.resume()
 }
 and then call this method:
 
 override func viewDidLoad() {
 Bookshop.getGenres {
 genres in
 println("View Controller: \(genres)")
 }
 } */

