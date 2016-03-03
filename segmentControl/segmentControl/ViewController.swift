//
//  ViewController.swift
//  segmentControl
//
//  Created by qimuyunduan on 16/3/3.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var first: UIView!
    
    @IBOutlet weak var second: UIView!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentControl.selectedSegmentIndex = 0
        second.hidden = true
        first .hidden = false
       
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    //实现segment value changed 事件
    @IBAction func switchView(sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            first.hidden = false
            second.hidden = true
            
        }
        else {
        
            first.hidden = true
            second.hidden = false
        
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

