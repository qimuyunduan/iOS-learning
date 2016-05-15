//
//  ViewController.swift
//  pageCache
//
//  Created by qimuyunduan on 16/5/14.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func loadSubView(sender: UIButton) {
        //get subViewController form storyBoard
        let picController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("subView")
        
        
        // --1-- add subView from subViewController
        self.view.addSubview(picController.view)
        
        //--2-- add subViewController
        addChildViewController(picController)
        picController.didMoveToParentViewController(self)
        
        
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

