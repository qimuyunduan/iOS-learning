//
//  ViewController.swift
//  UIPasteboard
//
//  Created by qimuyunduan on 16/3/12.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var copyLabel : UILabelCopy!
    var textInput : UITextField!
    var imageView1: UIImageCopy!
    var imageView2: UIImageCopy!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        copyLabel = UILabelCopy(frame: CGRectMake(30,30,100,30))
        copyLabel.text = "copy content"
        copyLabel.backgroundColor = UIColor.clearColor()
        textInput = UITextField(frame: CGRectMake(0,0,200,30))
        textInput.center = self.view.center
        textInput.backgroundColor = UIColor.lightGrayColor()
        
        imageView1 = UIImageCopy(frame: CGRectMake(50,80,100,100))
        imageView1.image = UIImage(named: "11.jpg")
        imageView2 = UIImageCopy(frame: CGRectMake(180,80,100,100))
        imageView2.backgroundColor = UIColor.lightGrayColor()
        
        self.view.addSubview(copyLabel)
        self.view.addSubview(textInput)
        self.view.addSubview(imageView1)
        self.view.addSubview(imageView2)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

