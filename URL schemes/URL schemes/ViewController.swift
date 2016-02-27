//
//  ViewController.swift
//  URL schemes
//
//  Created by qimuyunduan on 16/2/27.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: .System)
        button.layer.borderWidth = 1
        button.frame = CGRectMake(10, 150, 200, 30)
        button.setTitle("启动tableViewApp", forState: UIControlState.Normal)
        button.addTarget(self, action: Selector("launch"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func launch() {
        let urlString = "myCustomTableView://one"
        let url = NSURL(string: urlString)
        if (UIApplication.sharedApplication().canOpenURL(url!)){
        
            UIApplication.sharedApplication().openURL(url!)
        
        }
        else {
        
        let appUrl = "https://itunes.apple.com/cn/app/qq-you-xiang/id473225145?mt=8"
        let appLocation = NSURL(string: appUrl)
        UIApplication.sharedApplication().openURL(appLocation!)
        

        }
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

