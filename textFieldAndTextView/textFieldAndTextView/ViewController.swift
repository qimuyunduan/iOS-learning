//
//  ViewController.swift
//  textFieldAndTextView
//
//  Created by qimuyunduan on 15/11/22.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var myTextField : UITextField?
    var myTextView : UITextView?
    let screenSize = UIScreen.mainScreen().bounds
    
    
    func generateTextField(){
        
        myTextField = UITextField(frame: CGRectMake(CGFloat(Int(screenSize.width)/2-100) , CGFloat(Int(screenSize.height)/8), 200 , 50))
        myTextField!.backgroundColor = UIColor.lightGrayColor()
        myTextField!.font = UIFont.systemFontOfSize(16)
        myTextField!.placeholder = "请输入..."
        myTextField!.textColor = UIColor.blueColor()
        self.view.addSubview(myTextField!)
        
    }
    
    func generateTextView(){
        
        myTextView = UITextView(frame: CGRectMake(CGFloat(Int(screenSize.width)/2-100) , CGFloat(Int(screenSize.height)/8+100), 200 , 50))
        
        myTextView!.textColor = UIColor.blackColor()
        myTextView!.textAlignment = NSTextAlignment.Center
        myTextView!.editable = false
        myTextView!.text = "ViewController.swifttextFieldAndTextView" + "\n" + "Created by qimuyunduan onCopyright2015年 qimuyunduan. All rights reserved."
        self.view.addSubview(myTextView!)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.generateTextView()
        self.generateTextField()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

