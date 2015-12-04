//
//  ViewController.swift
//  UIWebview
//
//  Created by qimuyunduan on 15/11/26.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate{

    @IBOutlet var tudouWeb: UIWebView!
    override func viewDidLoad() {
        self.title = "tudou.com"
        tudouWeb.frame = self.view.frame
        //需要加上http
        tudouWeb.delegate = self
        let url = NSURL(string: "http://www.tudou.com")
        let urlRequest = NSURLRequest(URL: url!)
        tudouWeb.loadRequest(urlRequest)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func webViewDidStartLoad(webView: UIWebView){
    print("开始加载.....")
    
    }
    func webViewDidFinishLoad(webView: UIWebView){
    print("加载完成。")
    
    }
    func webView(webView: UIWebView,didFailLoadWithError error: NSError?){
    
    
    print(error)
    
    }

}

