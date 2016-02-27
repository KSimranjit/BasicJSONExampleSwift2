//
//  ViewController.swift
//  JSONExample
//
//  Created by Simranjit Kaur on 27/02/2016.
//  Copyright © 2016 Simranjit Kaur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://freegeoip.net/json/")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data , response, error ) -> Void in
            
            if let urlContent = data{
                
                //from json to readable data
                do {
                let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                
                print(jsonResult["city"])
                }catch
                {
                    print("JSON Serialization failed")
                }
            }
            
        }
        task.resume()
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

