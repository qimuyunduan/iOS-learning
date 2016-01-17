//
//  UIViewAnimationController.swift
//  annimation
//
//  Created by qimuyunduan on 16/1/16.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class UIViewAnimationController: UIViewController {
    
    
    @IBOutlet var fadeIN: UIButton!
    
    @IBOutlet var fadeOUT: UIButton!
    
    @IBOutlet var size: UIButton!
    @IBOutlet var move: UIButton!
    let redView = UIView()
    let blueView = UIView()
    
    //MARK: -淡入
    @IBAction func fadeIN(sender: UIButton) {
        
       
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        fadeIN.alpha = 0.0
        UIView.commitAnimations()
        
        
    }
    //MARK: -淡出
    
    @IBAction func fadeOUT(sender: AnyObject) {
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        fadeOUT.alpha = 1.0
        UIView.commitAnimations()
        
    }
    //MARK: -移动
    @IBAction func move(sender: UIButton) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        move.center = CGPointZero
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseOut)
        UIView.commitAnimations()
        
    }
    //MARK:-大小
    @IBAction func size(sender: UIButton) {
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        size.frame = CGRectMake(58, 326, 150, 60)
        UIView.commitAnimations()
    }
    
    //MARK:-下翻页
    @IBAction func curldown(sender: UIButton) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        UIView.setAnimationTransition(UIViewAnimationTransition.CurlDown, forView:
            self.view, cache: true)
        self.view.exchangeSubviewAtIndex(0, withSubviewAtIndex: 1)
        
    }
    //MARK: -上翻页
    @IBAction func curlup(sender: UIButton) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        UIView.setAnimationTransition(UIViewAnimationTransition.CurlUp, forView: self.view, cache: true)
        self.view.exchangeSubviewAtIndex(1, withSubviewAtIndex: 0)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fadeOUT.alpha = 0.2
        fadeIN.alpha = 1.0
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
