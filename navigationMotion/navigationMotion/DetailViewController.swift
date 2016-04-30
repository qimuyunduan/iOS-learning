//
//  ViewController.swift
//  navigationMotion
//
//  Created by qimuyunduan on 16/4/30.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        //启用滑动返回
        self.navigationController?.interactivePopGestureRecognizer!.delegate = self
    }
    @IBAction func back(sender: UIBarButtonItem) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

