//
//  ViewController.swift
//  XCtest
//
//  Created by qimuyunduan on 16/3/21.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        
        
        self.title   = "标题"
        let button   = UIButton(type: .System)
        button.frame = CGRectMake(0, 0, 65, 30)
        button.setTitle("返回", forState: .Normal)
        button.addTarget(self, action: "back", forControlEvents: UIControlEvents.TouchUpInside)
        let leftBarButton = UIBarButtonItem(customView: button)
        
        let spacer = UIBarButtonItem(barButtonSystemItem:.FixedSpace, target: nil, action: nil)
        //消除左边空隙
        spacer.width = -10
        self.navigationItem.leftBarButtonItems = [spacer,leftBarButton]
        //启用滑动放回
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func back() {
    
        self.navigationController?.popViewControllerAnimated(true)
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

