//
//  ViewController.swift
//  AnimationProgressBar
//
//  Created by qimuyunduan on 16/3/7.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var oProgressOne: OProgressBar!
    
    
    @IBOutlet weak var oProgressTwo: OProgressBar!
    
    
    @IBOutlet weak var oProgressThree: OProgressBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addProgress(sender: AnyObject) {
        oProgressOne.setProgress(oProgressOne.currentProgress+25, animated: true)
        oProgressTwo.setProgress(oProgressTwo.currentProgress+25, animated: true)
        oProgressThree.setProgress(oProgressThree.currentProgress+25, animated: true)
    }
    
    
    @IBAction func minusprogres(sender: AnyObject) {
        
        oProgressOne.setProgress(oProgressOne.currentProgress-20, animated: true)
        oProgressTwo.setProgress(oProgressTwo.currentProgress-20, animated: true)
        oProgressThree.setProgress(oProgressThree.currentProgress-20, animated: true)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

