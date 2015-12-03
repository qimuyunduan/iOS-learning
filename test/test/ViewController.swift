//
//  ViewController.swift
//  test
//
//  Created by qimuyunduan on 15/12/3.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func launch(sender: UIButton) {
        
       let secondStory = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        let secController = secondStory.instantiateViewControllerWithIdentifier("second") as! SecondController
//        secController.modalPresentationStyle = UIModalPresentationStyle.FormSheet
//        secController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
//        secController.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        secController.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        self.presentViewController(secController, animated: true, completion: nil)
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

