//
//  ViewController.swift
//  XCtest
//
//  Created by qimuyunduan on 16/3/21.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate,UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        
        
        self.title   = "标题"
        let url      = NSURL(string: "http://www.tudou.com")
        let request  = NSURLRequest(URL: url!)
        webView.delegate = self
        webView.backgroundColor = UIColor.grayColor()
        webView.loadRequest(request)
        
        
        let button   = UIButton(type: .System)
        button.frame = CGRectMake(0, 0, 65, 30)
        button.setTitle("返回", forState: .Normal)
        button.addTarget(self, action: #selector(ViewController.back), forControlEvents: UIControlEvents.TouchUpInside)
        let leftBarButton = UIBarButtonItem(customView: button)
        
        let spacer = UIBarButtonItem(barButtonSystemItem:.FixedSpace, target: nil, action: nil)
        //消除左边空隙
        spacer.width = -20
        self.navigationItem.leftBarButtonItems = [spacer,leftBarButton]
        //启用滑动放回
        let target = self.navigationController?.interactivePopGestureRecognizer?.delegate
        let panGesture = UIPanGestureRecognizer(target: target, action: nil)
        panGesture.delegate = self
        self.view.addGestureRecognizer(panGesture)
        self.navigationController?.interactivePopGestureRecognizer?.enabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    //是否应该同时识别其他的手势识别器
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.childViewControllers.count == 1 {
            return false
        }
        
        return true
    }
    
    func back() {
    
        self.navigationController?.popViewControllerAnimated(true)
    
    
    }
   func  webViewDidFinishLoad( webView: UIWebView) {
    
        print("加载完毕....")
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

