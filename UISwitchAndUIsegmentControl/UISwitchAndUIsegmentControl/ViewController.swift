//
//  ViewController.swift
//  UISwitchAndUIsegmentControl
//
//  Created by qimuyunduan on 15/11/25.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var label: UILabel = UILabel()
    var switcher:UISwitch = UISwitch()
    var segControl:UISegmentedControl = UISegmentedControl()
    let preStr = "你选择的是--"
    let functionSeg = ["共轭","是覅","恶风"," 儿童"]
    let screenBounds = UIScreen.mainScreen().bounds
    
    func initLabel() {
        
        label.frame = CGRectMake(screenBounds.width * CGFloat(0.25), screenBounds.height * CGFloat(0.25), 200, 30)
        label.backgroundColor = UIColor.grayColor()
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(25)
        label.textColor = UIColor.blackColor()
        label.text = "共有"+String(self.segControl.numberOfSegments)+"个Seg"
        self.view.addSubview(label)
    }
    func initSwitch() {
        
        switcher.frame = CGRectMake(screenBounds.width * CGFloat(0.25), screenBounds.height * CGFloat(0.35), 60, 30)
        switcher.on = true
        switcher.addTarget(self, action: "turnOff:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(switcher)
        
    }
    func initSegControl() {
        segControl = UISegmentedControl(items: functionSeg)
        segControl.frame = CGRectMake(screenBounds.width * CGFloat(0.25), screenBounds.height * CGFloat(0.45), 150, 30)
        segControl.selectedSegmentIndex = 0
        segControl.setTitle("菲菲", forSegmentAtIndex: 3)
        segControl.tintColor = UIColor.blueColor()
        segControl.addTarget(self, action: "funReview:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(segControl)
        
    }
    
    
    func turnOff(sender:AnyObject?) {
        let getSender = sender as! UISwitch
        self.label.textColor = UIColor.redColor()
        self.label.font = UIFont.systemFontOfSize(18)
        if getSender.on {
            
            self.label.text = "你已经打开UIswitch"
            
        }
        else{
            self.label.text = "你已经关闭UIswitch"
            
        }
        
        
    }
    func funReview(sender:AnyObject?){
        
        let  mySelect:UISegmentedControl = sender as! UISegmentedControl
        self.label.font = UIFont.systemFontOfSize(16)
        switch mySelect.selectedSegmentIndex {
            
        case 0:
            self.label.text = preStr + segControl.titleForSegmentAtIndex(0)!
        case 1:
            
            self.label.text = preStr + segControl.titleForSegmentAtIndex(1)!
        case 2:
            self.label.text = preStr + segControl.titleForSegmentAtIndex(2)!
        case 3:
            self.label.text = preStr + segControl.titleForSegmentAtIndex(3)!
            
        default:
            self.label.text = "你没有选中任何Segment！"
            
            
        }
        
    }
    override func viewDidLoad() {
        initSegControl()
        initLabel()
        
        initSwitch()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

