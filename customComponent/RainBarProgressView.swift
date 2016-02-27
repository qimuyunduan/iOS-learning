//
//  RainBarProgressView.swift
//  customComponent
//
//  Created by qimuyunduan on 16/2/27.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class RainBarProgressView : UIView {
    //set color for per progressView
    @IBInspectable var firstColor = UIColor(red: 37/255, green: 252/255, blue: 244/255, alpha: 1.0)
    @IBInspectable var secondColor = UIColor(red: 171/255, green: 250/255, blue: 81/255, alpha: 1.0)
    @IBInspectable var thirdColor = UIColor(red: 238/255, green: 32/255, blue: 53/255, alpha: 1.0)
    
    //set radius for per circle progressView 
    
    @IBInspectable var firstCircleRadius:CGFloat = 20
    @IBInspectable var secondCircleRadius:CGFloat = 45
    @IBInspectable var thirdCircleRadius:CGFloat = 70
    
    //set current progress 
    @IBInspectable var firstPercent :CGFloat = 0.4
    @IBInspectable var secondPercent :CGFloat = 0.4
    @IBInspectable var thirdPercent :CGFloat = 0.4
    
    //设置进度条宽度
    @IBInspectable var circleWidth:CGFloat = 16
    //设置进度条背景槽透明度
    @IBInspectable var barBgAlpha :CGFloat = 0.3
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }
    
    override func drawRect(rect: CGRect) {
        self.addCircle(firstCircleRadius, color: firstColor, percent: firstPercent)
        self.addCircle(secondCircleRadius, color: secondColor, percent: secondPercent)
        self.addCircle(thirdCircleRadius, color: thirdColor, percent: thirdPercent)
    }
    
    //添加环形进度
    func addCircle(radius:CGFloat,color:UIColor,percent:CGFloat) {
        
        let x = CGRectGetMidX(self.bounds)
        let y = CGRectGetMidY(self.bounds)
        
        //设置进度条圆弧背景
         var r:CGFloat = 0 ,g:CGFloat = 0 ,b:CGFloat = 0 ,a:CGFloat = 0
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
         let barBgColor = UIColor(red: r, green: g, blue: b, alpha: barBgAlpha)
        
        let barBgPath = UIBezierPath(arcCenter: CGPoint(x: x, y: y), radius: radius, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat(M_PI * 1.5), clockwise: true).CGPath
        self.addOval(circleWidth, path: barBgPath, strokeStart: 0, strokeEnd: 1, strokeColor: barBgColor, fillColor: UIColor.clearColor(), shadowRadius: 0, shadowOpacity: 0, shadowOffset: CGSizeZero)
        
        
        
        
        
        //使用贝塞尔曲线画路径
        let barpath = UIBezierPath(arcCenter: CGPoint(x: x, y: y), radius: radius, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat(M_PI * 1.5), clockwise: true).CGPath
        
        self.addOval(circleWidth,path:barpath,strokeStart:0,strokeEnd:percent,strokeColor:color,fillColor:UIColor.clearColor(),shadowRadius:0,shadowOpacity:0,shadowOffset:CGSizeZero)
        
        //设置进度条起点圆头
        let startPath = UIBezierPath(ovalInRect: CGRectMake(x-circleWidth/2, y-radius-circleWidth/2, circleWidth, circleWidth)).CGPath
        self.addOval(0.0, path: startPath, strokeStart: 0, strokeEnd: 1.0, strokeColor: color, fillColor: UIColor.whiteColor(), shadowRadius: 0, shadowOpacity: 0, shadowOffset: CGSizeZero)
        
        //设置进度条终点圆头
        
        let endPoint = calCircleCenter(CGPoint(x: x, y: y),radius: radius,angle: -percent*360+90)
        let endPath = UIBezierPath(ovalInRect: CGRectMake(endPoint.x-circleWidth/2, endPoint.y-circleWidth/2, circleWidth, circleWidth)).CGPath
        self.addOval(0.0, path: endPath, strokeStart: 0, strokeEnd: 1.0, strokeColor: color, fillColor: UIColor.blackColor(), shadowRadius: 5.0, shadowOpacity: 0.5, shadowOffset: CGSizeZero)
        
        //进度条遮罩（圆弧）
        let barMaskPath = UIBezierPath(arcCenter: CGPoint(x: x, y: y), radius: radius, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat(M_PI * 1.5), clockwise: true).CGPath
        self.addOval(circleWidth, path: barMaskPath, strokeStart: percent/6, strokeEnd: percent, strokeColor: color, fillColor: UIColor.clearColor(), shadowRadius: 0, shadowOpacity: 0, shadowOffset: CGSizeZero)
        
        //进度条遮罩（圆）
        
        if percent < 0.5 {
        
        self.addOval(5, path: startPath, strokeStart: 0, strokeEnd: 1.0, strokeColor: color, fillColor: UIColor.blueColor(), shadowRadius: 0, shadowOpacity: 0, shadowOffset: CGSizeZero)
        
        
        }
    }
    
    
    
    
    
    func calCircleCenter(center:CGPoint,radius:CGFloat,angle:CGFloat) -> CGPoint {
        
        let X = radius*CGFloat(cosf(Float(angle)*Float(M_PI)/Float(180)))
        let Y = radius*CGFloat(sinf(Float(angle)*Float(M_PI)/Float(180)))
    
        return CGPointMake(center.x+X, center.y+Y)
    }
    //添加圆弧
    func addOval(lineWidth:CGFloat,path:CGPathRef,strokeStart:CGFloat,strokeEnd:CGFloat,strokeColor:UIColor,fillColor:UIColor,shadowRadius:CGFloat,shadowOpacity:Float,shadowOffset:CGSize) {
    
        let arc = CAShapeLayer()
        arc.lineWidth = lineWidth
        arc.path = path
        arc.strokeStart = strokeStart
        arc.strokeEnd = strokeEnd
        arc.strokeColor = strokeColor.CGColor
        arc.fillColor = fillColor.CGColor
        
        arc.shadowColor = UIColor.blackColor().CGColor
        arc.shadowRadius = shadowRadius
        arc.shadowOffset = shadowOffset
        
        layer.addSublayer(arc)
        
        
        
    
    }

}
