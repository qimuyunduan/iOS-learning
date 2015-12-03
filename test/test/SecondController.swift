//
//  SecondController.swift
//  test
//
//  Created by qimuyunduan on 15/12/3.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//

import UIKit

class SecondController: UIViewController {

    @IBAction func returnToMain(sender: UIButton) {
        
//        let mainStory = UIStoryboard(name: "Main", bundle: nil)
//        let mainController = mainStory.instantiateViewControllerWithIdentifier("second") as! SecondController
//        mainController.modalPresentationStyle = UIModalPresentationStyle.PageSheet
//        //        secController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
//        //        secController.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
//        //        secController.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
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