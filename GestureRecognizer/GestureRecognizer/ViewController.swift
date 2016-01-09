//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by qimuyunduan on 16/1/9.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /**
     add Tap action to self.view
     */
    func addTapGestureRecognizer() {
        
        let atap = UITapGestureRecognizer(target: self, action: "tapDo:")
        self.view.addGestureRecognizer(atap)
        atap.numberOfTapsRequired = 1
    }
    /**
     add pan gesture to self.view
     */
    func addPanGestureRecognizer() {
        let apan = UIPanGestureRecognizer(target: self, action: "handlePan:")
        self.view.addGestureRecognizer(apan)
        apan.minimumNumberOfTouches = 1
        apan.maximumNumberOfTouches = 3
        
    }
    /**
     add long press action to self.view
     */
    func addLongPressRecognizer() {
        let alongPress = UILongPressGestureRecognizer(target: self, action: "longPress:")
        alongPress.minimumPressDuration = 1
        self.view.addGestureRecognizer(alongPress)
    }
    /**
     add pinch recognizer to self,view
     */
    func addPinchRecognizer() {
        let apinch = UIPinchGestureRecognizer(target: self, action: "pinchDo:")
        self.view.addGestureRecognizer(apinch)
        
    }
    /**
     add leftSwipe action to self.view
     */
    func addLeftSwipe() {
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: "leftSwipe:")
        leftSwipe.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(leftSwipe)
    }
    /**
     add downSwipe action to self.view
     */
    func adddownLeftSwipe() {
        let downSwipe = UISwipeGestureRecognizer(target: self, action: "downSwipe:")
        downSwipe.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(downSwipe)
    }
    /**
     add rightSwipe action to self.view
     */
    func addRightSwipe() {
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: "rightSwipe:")
        rightSwipe.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(rightSwipe)
    }
    /**
     add upSwipe action to self.view
     */
    func addUpSwipe() {
        let upSwipe = UISwipeGestureRecognizer(target: self, action: "upSwipe:")
        upSwipe.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(upSwipe)
    }
    /**
     unify gestureRecognizer to one view
     */
    func addGestureRecognizerToView() {
        
        addLeftSwipe()
        addRightSwipe()
        addTapGestureRecognizer()
        addUpSwipe()
        addPinchRecognizer()
        adddownLeftSwipe()
        addLongPressRecognizer()
        addPanGestureRecognizer()
        
    }
    
    /**
     function for tapRecognizer
     
     
     - parameter sender: UITapGestureRecognizer
     */
    func tapDo(sender:UITapGestureRecognizer) {
        print("sender:UITapGestureRecognizer :numberOfTapsRequired is " + String(sender.numberOfTapsRequired))
        
    }
    
    /**
     function for panRecognizer
     
     - parameter sender: UIPanGestureRecognizer
     */
    func handlePan(sender:UIPanGestureRecognizer) {
        print("sender:UIPanGestureRecognizer :maximumNumberOfTouches is " + String(sender.maximumNumberOfTouches))
    }
    /**
     function for LongPressRecognizer
     
     - parameter sender: UILongPressGestureRecognizer
     */
    func longPress(sender:UILongPressGestureRecognizer){
        print("sender:UILongPressGestureRecognizer :minimumPressDuration is " + String(sender.minimumPressDuration))
        
    }
    /**
     function for pinchGestureRecognizer
     
     - parameter sender: UIPinchGestureRecognizer
     */
    func pinchDo(sender:UIPinchGestureRecognizer) {
        print("sender:UIPinchGestureRecognizer: scale is " + String(sender.scale))
        
    }
    /**
     function for leftSwipeRecognizer
     
     - parameter sender: UISwipeGestureRecognizer
     */
    func leftSwipe(sender:UISwipeGestureRecognizer) {
        print("sender:UISwipeGestureRecognizer direction is " + String(sender.direction))
    }
    /**
     function for rightSwipeRecognizer
     
     - parameter sender: UISwipeGestureRecognizer
     */
    func rightSwipe(sender:UISwipeGestureRecognizer) {
        print("sender:UISwipeGestureRecognizer direction is " + String(sender.direction))
    }
    /**
     function for upSwipeRecognizer
     
     - parameter sender: UISwipeGestureRecognizer
     */
    func upSwipe(sender:UISwipeGestureRecognizer) {
        print("sender:UISwipeGestureRecognizer direction is " + String(sender.direction))
    }
    /**
     function for downSwipeRecognizer
     
     - parameter sender: UISwipeGestureRecognizer
     */
    func downSwipe(sender:UISwipeGestureRecognizer) {
        print("sender:UISwipeGestureRecognizer direction is " + String(sender.direction))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(colorLiteralRed: 0.25, green: 0.29, blue: 0.32, alpha: 1.00)
        addGestureRecognizerToView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

