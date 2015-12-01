//
//  ViewController.swift
//  UILabelANDUIButtonn
//
//  Created by qimuyunduan on 15/11/23.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    
    @IBOutlet var myButton: UIButton!
    
    
    
    @IBOutlet var myLabel: UILabel!
    
    
    
    
   @IBAction func showMyLabel(sender: UIButton) {
    
    
    self.myLabel.enabled = true
    
    
    }
    
    func initButton(){
        

    self.myButton.titleLabel?.font = UIFont.systemFontOfSize(16)
    self.myButton.backgroundColor = UIColor.lightGrayColor()
    self.myButton.titleLabel?.textColor = UIColor.blueColor()
    self.myButton.titleLabel?.textAlignment = NSTextAlignment.Center
    self.myButton.showsTouchWhenHighlighted = true

    }
    func initLabel(){
    
    self.myLabel.font = UIFont.systemFontOfSize(16)
    self.myLabel.backgroundColor = UIColor.whiteColor()
    self.myLabel.text = "hello world!"
    self.myLabel.textColor = UIColor.blueColor()
    self.myLabel.textAlignment = NSTextAlignment.Center
    self.myLabel.userInteractionEnabled = false
    self.myLabel.enabled = false
    
    
    }
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.initButton()
        self.initLabel()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

