//
//  OPregressBar.swift
//  AnimationProgressBar
//
//  Created by qimuyunduan on 16/3/7.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

@IBDesignable  class OProgressBar : UIView {
    
    struct Constant {
        //进度条宽度
        static let lineWidth :CGFloat = 10
        //进度槽颜色
        static let trackColor = UIColor(red: 245/255, green: 245/255 ,blue: 245/255, alpha: 1.0)
        //进度条颜色
        static let color = UIColor.orangeColor()
    }
    //进度槽
    let trackLayer = CAShapeLayer()
    //进度条
    let progressLayer = CAShapeLayer()
    //进度条路径
    let path = UIBezierPath()
    //头部圆点
    var dot = UIView()
    //头部箭头图片
    var arrow = UIImageView(image:UIImage(named: "arrow"))
    
    //进度条圆环中点
    var progressCenter :CGPoint {
    
        get {
            
        return CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds))
            
        }
    
    }
    
    //进度条圆环半径
    var radius:CGFloat {
    
        get {
        
        return bounds.size.width/2-Constant.lineWidth
        }
    
    }
    //当前进度
    @IBInspectable var currentProgress :Int = 0 {
    
        didSet {
            if currentProgress > 100 {
                currentProgress = 100
            }
            else if currentProgress < 0 {
            
                currentProgress = 0
            }
        
        }
    
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func drawRect(rect: CGRect) {
        //获取整个进度条圆圈路径
        path.addArcWithCenter(progressCenter, radius: radius, startAngle: angleToRadian(-90), endAngle: angleToRadian(270), clockwise: true)
        //绘制进度槽
        trackLayer.frame = bounds
        trackLayer.strokeColor = UIColor.whiteColor().CGColor
        trackLayer.fillColor = UIColor.clearColor().CGColor
       
        trackLayer.lineWidth = Constant.lineWidth
        trackLayer.path = path.CGPath
        layer.addSublayer(trackLayer)
        
        //绘制进度条
        progressLayer.frame = bounds
        progressLayer.fillColor = UIColor.clearColor().CGColor
        progressLayer.strokeColor = UIColor.yellowColor().CGColor
        progressLayer.lineWidth = Constant.lineWidth
        progressLayer.path = path.CGPath
        //进度开始点，结束点
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = CGFloat(currentProgress)/100
        layer.addSublayer(progressLayer)
        
        //绘制进度条头部圆点
        dot.frame = CGRectMake(0, 0, Constant.lineWidth, Constant.lineWidth)
        let dotPath = UIBezierPath(ovalInRect: CGRectMake(0, 0, Constant.lineWidth, Constant.lineWidth)).CGPath
        let arc = CAShapeLayer()
        arc.lineWidth = 0
        arc.path = dotPath
        arc.strokeStart = 0
        arc.strokeEnd = 1
        arc.strokeColor = Constant.color.CGColor
        arc.fillColor = Constant.color.CGColor
        arc.shadowColor = UIColor.blackColor().CGColor
        arc.shadowRadius = 5.0
        arc.shadowOpacity = 1
        arc.shadowOffset = CGSizeZero
        dot.layer.addSublayer(arc)
        addSubview(dot)
        
        
        //圆点添加箭头图标
        arrow.frame.size = CGSize(width: Constant.lineWidth, height: Constant.lineWidth)
        dot.addSubview(arrow)
      
        
        //设置圆点位置
        dot.layer.position = pointPosition(progressCenter, radius: radius, angle: CGFloat(currentProgress/100*360-90))
        
    }
    //设置进度（可以设置是否播放动画）
    func setProgress(pro:Int,animated anim :Bool) {
    
        setProgress(pro,animated:anim,withDuration:0.5)
    
    
    }
    //设置进度
    func setProgress(pro:Int,animated anim :Bool,withDuration duration :Double) {
        
        let oldProgress = currentProgress
        currentProgress = pro
        
        //进度条动画
        CATransaction.begin()
        //设置是否disable进度动画
        CATransaction.setDisableActions(!anim)
        //设置动画运行过程的时间函数
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
        CATransaction.setAnimationDuration(duration)
        progressLayer.strokeEnd  = CGFloat(currentProgress)/100
        CATransaction.commit()
        
        //头部圆点动画
        let startAngle = angleToRadian(360*Double(oldProgress)/100-90)
        let endAngle = angleToRadian(360*Double(currentProgress)/100-90)
        let clockWise = currentProgress > oldProgress ? false:true
        print(clockWise)
        let path = CGPathCreateMutable()
        CGPathAddArc(path, &transform, CGRectGetMidX(bounds), CGRectGetMidY(bounds), radius, startAngle, endAngle, clockWise)
        
        let orbit = CAKeyframeAnimation(keyPath: "position")
        orbit.path = path
        orbit.duration = duration
        orbit.calculationMode = kCAAnimationPaced
        orbit.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        orbit.rotationMode = kCAAnimationRotateAuto
        orbit.removedOnCompletion = false
        orbit.fillMode = kCAFillModeForwards
        
        dot.layer.addAnimation(orbit, forKey: "Move")
        
        
        
    
    }
    //把角度转为弧度
    private func angleToRadian(angle:Double) -> CGFloat {
    
        return CGFloat(angle/Double(180)*M_PI)

    
    }
    //计算圆弧上点的坐标
    
    func pointPosition(center:CGPoint,radius:CGFloat,angle:CGFloat) -> CGPoint {
    
        let x = radius*CGFloat(cosf(Float(angle)*Float(M_PI)/Float(180)))
        let y = radius*CGFloat(sinf(Float(angle)*Float(M_PI)/Float(180)))
        return CGPointMake(center.x+x, center.y+y)
       
    
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
}
