//
//  CATransitionAnimationController.swift
//  annimation
//
//  Created by qimuyunduan on 16/1/16.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class CATransitionAnimationController: UIViewController {
    //six steps to create CATransition 
    //step one: create CATrasition object
    //step two:set Animation duration time
    //step three:set the type of Animation
    //step four:set Animation direction
    //step five:execute Animation action
    //step six :add to layer of Core Animation
    let redView = UIView()
    let blueView = UIView()
    let buttonOne = UIButton(type:UIButtonType.System )
    let buttonTwo = UIButton(type: UIButtonType.System )
    /**
     add subView UIView and buttons to  Self.view
     */
    func addViews() {
        redView.frame = CGRectMake(200, 70, 120, 200)
        redView.backgroundColor = UIColor.redColor()
        redView.center = self.view.center
        self.view.addSubview(redView)
        blueView.frame = CGRectMake(200, 70, 120, 200)
        blueView.backgroundColor = UIColor.blueColor()
        blueView.center = self.view.center
        self.view.addSubview(blueView)
        buttonOne.frame = CGRectMake(200, 120, 50,30)
        buttonOne.layer.cornerRadius = 5
        buttonOne.center.x = self.view.center.x-30
        buttonOne.center.y = self.view.center.y+150
        buttonOne.backgroundColor = UIColor.yellowColor()
        buttonOne.setTitle("push", forState: UIControlState.Normal)
        buttonOne.addTarget(self, action: "push:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonTwo.frame = CGRectMake(200, 120, 60,30)
        buttonTwo.layer.cornerRadius = 5
        buttonTwo.center.x = self.view.center.x+30
        buttonTwo.center.y = self.view.center.y+150
        buttonTwo.backgroundColor = UIColor.yellowColor()
        buttonTwo.setTitle("moveIN", forState: UIControlState.Normal)
        buttonTwo.addTarget(self, action: "moveIN:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buttonOne)
        self.view.addSubview(buttonTwo)
    }
    /**
     push transition animation
     
     - parameter sender: button to launch animation
     */
    func push(sender:UIButton) {
        let transition = CATransition()
        transition.duration = 1.0
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.exchangeSubviewAtIndex(1, withSubviewAtIndex: 0)
        self.view.layer.addAnimation(transition, forKey: nil)
    
    }
    
    func moveIN(sender:UIButton) {
        let transition = CATransition()
        transition.duration = 1.0
        transition.type = kCATransitionMoveIn
        transition.subtype = kCATransitionFromTop
        self.view.exchangeSubviewAtIndex(0, withSubviewAtIndex: 1)
        self.view.layer.addAnimation(transition, forKey: nil)
        

    
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
