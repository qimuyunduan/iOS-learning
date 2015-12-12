//
//  ViewController.swift
//  UIActivityIndicatorAndprogressView
//
//  Created by qimuyunduan on 15/11/27.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var progressBar  = UIProgressView()
    let button = UIButton()
    let activityView = UIActivityIndicatorView()
    var timer = NSTimer()
    var progressValue:Float = 0.0
    
    //initial button
    func initButton() {
    button.frame = CGRectMake(0, 0, 80, 30)
    button.center.y = self.view.center.y
    button.center.x = self.view.center.x - CGFloat(100)
    button.layer.cornerRadius = 15
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.blueColor().CGColor
    button.showsTouchWhenHighlighted = true
    button.setTitle("开始", forState: UIControlState.Normal)
    button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
    button.titleLabel?.font = UIFont.systemFontOfSize(18)
    button.titleLabel?.textAlignment = NSTextAlignment.Center
    if button.titleForState(.Normal) == "开始" {
        
    button.addTarget(self, action: "start", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
       
    
    self.view.addSubview(button)
    }
    // initial progressView
    func initProgress(){
    progressBar.frame = CGRectMake(0, 0, 100, 20)
    progressBar.center.x = self.view.center.x  + CGFloat(30)
    progressBar.center.y = self.view.center.y
    progressBar.progressViewStyle = UIProgressViewStyle.Bar
    progressBar.trackTintColor = UIColor.greenColor()
    progressBar.tintColor = UIColor.blueColor()
    progressBar.progress = 0.0
    self.view.addSubview(progressBar)
    
    }
    
    // initial activityIndicatorView
    func initActivityView(){
    
    
    activityView.color = UIColor.blueColor()
    activityView.center.x = self.view.center.x
    activityView.center.y = self.view.center.y + CGFloat(60)
    activityView.hidesWhenStopped = true
    self.view.addSubview(activityView)
    
    }
    func timerController() {
    
        if progressBar.progress != 1.0 && timer.valid {
        print(progressValue)
        progressValue  += 0.1
        progressBar.setProgress(progressValue, animated: true)
        
        
        
        }
        else if progressBar.progress == 1.0 {
            
        restart()
        print("重新开始...")
      
        
        }
    
    
    }
    func start() {
        
        activityView.startAnimating()
//        progressBar.setProgress(progressValue, animated: true)
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("timerController"), userInfo: nil, repeats: true)
        print("开始计时...")
        timer.fire()
        
       
        button.setTitle("停止", forState: UIControlState.Normal)
        button.addTarget(self, action: "stop", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    func stop() {
        
        activityView.stopAnimating()
        print("当前值为\(progressValue)...")
//        progressValue = progressBar.progress
        print("停止计时...")
        timer.invalidate()
       
        
        button.setTitle("开始", forState: UIControlState.Normal)
        button.addTarget(self, action: "start", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    func restart() {
    activityView.stopAnimating()    
    progressBar.setProgress(0.0, animated: true)
    progressValue = 0.0
    
    timer.invalidate()
    button.setTitle("开始", forState: UIControlState.Normal)
    button.addTarget(self, action: "start", forControlEvents: UIControlEvents.TouchUpInside)
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initButton()
        initProgress()
        initActivityView()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

