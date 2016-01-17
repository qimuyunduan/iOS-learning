//
//  CABasicAnimationController.swift
//  annimation
//
//  Created by qimuyunduan on 16/1/16.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
class CABasicAnimationController: UIViewController {
    
    
    @IBOutlet var image: UIImageView!
    //-不透明度
    @IBAction func cabOpacity(sender: UIButton) {
        let animation = CABasicAnimation(keyPath: "opacity")
        
        animation.fromValue = 1.0
        animation.toValue = 0.0
        animation.duration = 3.0
        image.layer.addAnimation(animation, forKey: "Image-opacity")
        image.alpha = 0.0
    }
    //开启 clip subview 属性
    @IBAction func cabExpend(sender: UIButton) {
        let animation = CABasicAnimation(keyPath: "bounds.size")
        animation.fromValue = NSValue(CGSize:CGSizeMake(2.0, 2.0))
        animation.toValue = NSValue(CGSize:image.frame.size)
        animation.duration = 3.0
        image.layer.addAnimation(animation, forKey: "Image-expen")
        
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
