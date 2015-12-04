//
//  ViewController2.swift
//  UIWebview
//
//  Created by qimuyunduan on 15/11/26.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController2:UIViewController,UIWebViewDelegate {

    @IBOutlet var youkuWeb: UIWebView!
    override func viewDidLoad() {
        
        self.title = "youku.com"
        youkuWeb.frame = self.view.frame
        let url = NSURL(string: "http://www.youku.com")
        let urlRequest = NSURLRequest(URL: url!)
        youkuWeb.loadRequest(urlRequest)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
