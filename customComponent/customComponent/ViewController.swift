//
//  ViewController.swift
//  customComponent
//
//  Created by qimuyunduan on 16/2/27.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rainBarOne = RainBarProgressView(frame: CGRectMake(5,20,160,160))
        self.view.addSubview(rainBarOne)
        
        let rainBarTwo = RainBarProgressView(frame: CGRectMake(175,20,140,140))
        
        rainBarTwo.circleWidth = 18
        rainBarTwo.firstCircleRadius = 20
        rainBarTwo.secondCircleRadius = 40
        rainBarTwo.thirdCircleRadius = 60

        self.view.addSubview(rainBarTwo)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

