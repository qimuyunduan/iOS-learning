//
//  ViewController.swift
//  UIAlertViewAndUIActionSeet
//
//  Created by qimuyunduan on 15/11/27.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func alert(sender: UIButton) {
        
        let alertView = UIAlertView()
        alertView.title = "warring"
         alertView.addButtonWithTitle("确定")
        alertView.addButtonWithTitle("取消")
       
        alertView.cancelButtonIndex = 1
        alertView.delegate = self
        alertView.message = "are you sure what you are doing?"
        alertView.alertViewStyle = UIAlertViewStyle.Default
        
        alertView.show()
        
        
        
    }
    @IBAction func sheet(sender: UIButton) {
        
        let sheet = UIActionSheet()
        sheet.addButtonWithTitle("ActionOne")
        sheet.addButtonWithTitle("ActionTwo")
        sheet.addButtonWithTitle("ActionThree")
        sheet.addButtonWithTitle("cancel")
        sheet.cancelButtonIndex = 3
        sheet.title = "choose one"
        sheet.showInView(self.view)
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

