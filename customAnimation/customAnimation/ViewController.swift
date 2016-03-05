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
        //创建用于转移坐标的Transform,这样我们不用按照实际显示坐标计算
        var transform:CGAffineTransform = CGAffineTransformMakeTranslation(centerX, 50)
        //可以通过CGPathCreateMutable可以将多条弧线，直线拼接成一个复杂的路径
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, &transform, 0, 0)
        CGPathAddLineToPoint(path, &transform, 0, 75)
        CGPathAddLineToPoint(path, &transform, 75, 75)
        CGPathAddArc(path, &transform, 0, 75, 75, 0, CGFloat(1.5 * M_PI), false)
        
        //旋转动画
        let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        rotateAnimation.values = [0,20 * M_PI]
        
        //let boundingRect = CGRectMake(centerX-75, 50, 200, 150)
        let orbit = CAKeyframeAnimation(keyPath: "position")
        //orbit.duration = 3
        //orbit.path = CGPathCreateWithEllipseInRect(boundingRect, nil)
        orbit.path = path
        orbit.calculationMode = kCAAnimationCubicPaced
        //设置是否在动画结束后从动画层中移除动画
        orbit.removedOnCompletion = false
        orbit.fillMode = kCAFillModeForwards
        
        //设为HUGE为无限
        //orbit.repeatCount = HUGE
        //在移动过程中设置旋转
        //orbit.rotationMode = kCAAnimationRotateAutoReverse
        
        //组合两个动画
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [rotateAnimation,orbit]
        animationGroup.duration = 2
        animationGroup.repeatCount = HUGE
        
        square.layer.addAnimation(animationGroup, forKey: "Move")
        //让方块运动一周后停留在终点位置（否则会回到原来的位置）
        //square.layer.position = CGPointMake(centerX+75, 125)
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

