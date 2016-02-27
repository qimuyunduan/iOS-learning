//
//  ViewController.swift
//  handleGif
//  使用github上开源的UIImage 扩展类  https://github.com/bahlo/SwiftGif
//  Created by qimuyunduan on 16/2/27.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        /// .gifWithName 不需要加上文件的扩展名
        let gifOne = UIImageView(image: UIImage.gifWithName("1"))
        gifOne.frame = CGRectMake(30, 30, 200, 200)
        self.view.addSubview(gifOne)
        let gifTwo = UIImageView(image: UIImage.gifWithData(NSData(contentsOfURL: NSBundle.mainBundle().URLForResource("2", withExtension: ".gif")!)!))
        gifTwo.frame = CGRectMake(30, 250, 200, 200)
        self.view.addSubview(gifTwo)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

