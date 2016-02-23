//
//  CAKeyframeAnimationController.swift
//  annimation
//
//  Created by qimuyunduan on 16/1/16.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class CAKeyframeAnimationController: UIViewController {
    
    @IBOutlet var testImageView: UIImageView!
    
    @IBAction func cakFly(sender: UIButton) {
        let animation = CAKeyframeAnimation(keyPath: "position")
        let p1 = CGPointMake(0.0, 0.0)
        let p2 = CGPointMake(320, 0.0)
        let p3 = CGPointMake(0, 460.0)
        let p4 = CGPointMake(320.0, 460.0)
        let p5 = CGPointMake(160.0, 200.0)
        
        animation.values = [NSValue(CGPoint:p1),NSValue(CGPoint: p2),NSValue(CGPoint: p3),NSValue(CGPoint: p4),NSValue(CGPoint: p5)]
        animation.keyTimes = [NSNumber(float: 0.0),NSNumber(float: 0.4),NSNumber(float: 0.6),NSNumber(float: 0.8),NSNumber(float: 1.0)]
        animation.duration = 5.0
        testImageView.layer.addAnimation(animation, forKey: "Image-Fly")
        
        
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
