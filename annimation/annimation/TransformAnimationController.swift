//
//  TransformAnimationController.swift
//  annimation
//
//  Created by qimuyunduan on 16/1/16.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class TransformAnimationController: UIViewController {
    
    
    
    @IBOutlet var translateButton: UIButton!
    
    @IBOutlet var rotateButton: UIButton!
    
    @IBOutlet var scale: UIButton!

    @IBOutlet var test: UIView!
    
    @IBAction func translate(sender: UIButton) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1)
        test.transform = CGAffineTransformTranslate(test.transform, 0.2, 0.3)
        UIView.commitAnimations()
    }
    
    @IBAction func rotate(sender: UIButton) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2)
        test.transform = CGAffineTransformRotate(test.transform, CGFloat(-M_PI/2))
        UIView.commitAnimations()
    }
    @IBAction func scale(sender: UIButton) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.5)
        test.transform = CGAffineTransformScale(test.transform, 1.5,1.5)
        UIView.commitAnimations()
        
        
    }
    /**
     动画：反转到某个初始状态
     
     - parameter sender: launch invert animation
     */
    @IBAction func inverse(sender: UIButton) {
        
        test.transform = CGAffineTransformIdentity
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        test.transform = CGAffineTransformConcat(test.transform, CGAffineTransformInvert(test.transform))
        UIView.commitAnimations()
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
