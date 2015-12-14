//
//  LoginViewController.swift
//  UIScrollViewAndUIpageControl
//
//  Created by qimuyunduan on 15/12/9.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//

import UIKit


class LoginViewController:UIViewController {
    
  
    @IBOutlet var user: UITextField!
    
    @IBOutlet var serret: UITextField!
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    
    @IBAction func tapView(sender: AnyObject) {
        
        self.user.resignFirstResponder()
        self.serret.resignFirstResponder()
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}
