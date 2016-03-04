//
//  ViewController.swift
//  customAnimation
//
//  Created by qimuyunduan on 16/3/4.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    var square:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        square = UIView(frame: CGRectMake(0,0,20,20))
        square.backgroundColor = UIColor.brownColor()
        self.view.addSubview(square)
        circleAnimation()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func circleAnimation() {
        
        let centerX = view.bounds.size.width/2
        let boundingRect = CGRectMake(centerX-75, 50, 150, 150)
        let orbit = CAKeyframeAnimation(keyPath: "position")
        orbit.duration = 3
        orbit.path = CGPathCreateWithEllipseInRect(boundingRect, nil)
        orbit.calculationMode = kCAAnimationPaced
        square.layer.addAnimation(orbit, forKey: "Move")
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

