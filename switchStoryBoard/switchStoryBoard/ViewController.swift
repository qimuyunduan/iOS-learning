//
//  ViewController.swift
//  switchStoryBoard
//
//  Created by qimuyunduan on 15/12/3.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func launchSecondController() {
        
//       let secondStoryboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
//        let secondViewController = secondStoryboard.instantiateViewControllerWithIdentifier("secondController") as! SecondViewController
//        presentViewController(secondViewController, animated: true, completion: nil)
        print("success!")
        
    }
    override func viewDidLoad() {
        
//        let mainStory = UIStoryboard(name: "Main", bundle: nil)
//        let rootController = mainStory.instantiateViewControllerWithIdentifier("mainController") as! ViewController
//        self.window?.rootViewController = rootController
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

