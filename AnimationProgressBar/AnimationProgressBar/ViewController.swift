//
//  ViewController.swift
//  AnimationProgressBar
//
//  Created by qimuyunduan on 16/3/7.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   var oProgressOne: OProgressBar!
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oProgressOne = OProgressBar(frame: CGRectMake(0,0,200,200))
        
        oProgressOne.backgroundColor = UIColor.brownColor()
        self.view.addSubview(oProgressOne)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addProgress(sender: AnyObject) {
        oProgressOne.setProgress(oProgressOne.currentProgress+25, animated: false)
            }
    
    
    @IBAction func minusprogres(sender: AnyObject) {
        
        oProgressOne.setProgress(oProgressOne.currentProgress-20, animated: true)
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

