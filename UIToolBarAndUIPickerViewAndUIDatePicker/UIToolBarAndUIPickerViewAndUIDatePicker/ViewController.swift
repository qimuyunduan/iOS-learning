//
//  ViewController.swift
//  UIToolBarAndUIPickerViewAndUIDatePicker
//
//  Created by qimuyunduan on 15/11/27.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let datepicker = UIDatePicker()
    var toolbar = UIToolbar()
    let textInput = UITextField()
    let button = UIButton(type: .System)
    
    
    func getDate() {
        
        let date = datepicker.date
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        let dateString  = dateFormatter.stringFromDate(date)
        textInput.text = dateString
        
        
        
    }
    func initToolbar() {
        
        toolbar.frame = CGRectMake(0,20,self.view.frame.width,30)
        let barButtonItem1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Camera, target: nil, action: nil)
        let barButtonItem2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let barButtonItem3 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Bookmarks, target: nil, action: nil)
        let barButtonItem4 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: nil, action: nil)
        toolbar.setItems([barButtonItem1,barButtonItem2,barButtonItem3,barButtonItem4], animated: true)
        self.view.addSubview(toolbar)
        
        
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor  = UIColor.whiteColor()
        let view   = UIView(frame: CGRectMake(0,0,250,30))
        view.center = self.view.center
        textInput.frame = CGRectMake(0,0,150,30)
//        textInput.center = self.view.center
        textInput.placeholder = "请输入时间...."
        textInput.textColor = UIColor.blueColor()
        textInput.textAlignment = NSTextAlignment.Center
        textInput.font = UIFont.systemFontOfSize(15)
        textInput.layer.borderColor = UIColor.grayColor().CGColor
        textInput.layer.borderWidth = 1
        textInput.layer.cornerRadius = 10
        button.setTitle("确定", forState: UIControlState.Normal)
        button.layer.backgroundColor = UIColor.grayColor().CGColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        button.showsTouchWhenHighlighted = true
        button.frame = CGRectMake(190,0,60,30)
//        button.center.x = self.textInput.center.x + CGFloat(120)
//        button.center.y = self.textInput.center.y
        button.addTarget(self, action: "getDate", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(textInput)
        view.addSubview(button)
        datepicker.center.x = self.view.center.x
        datepicker.center.y = self.view.center.y + 150
        datepicker.datePickerMode = UIDatePickerMode.Date
        datepicker.locale = NSLocale(localeIdentifier: "zh_CN")
        self.view.addSubview(view)
       
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(datepicker)
        initToolbar()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

