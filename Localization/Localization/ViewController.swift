//
//  ViewController.swift
//  Localization
//
//  Created by qimuyunduan on 16/1/19.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myImage.image = UIImage(named: "9.jpg")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

