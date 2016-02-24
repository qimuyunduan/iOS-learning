//
//  ViewController.swift
//  UIShare
//
//  Created by qimuyunduan on 16/2/24.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var Button :UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let statusBarHeight =  UIApplication.sharedApplication().statusBarFrame.height

        print(statusBarHeight)
      
        Button = UIButton(type: UIButtonType.System)
        Button!.frame = CGRectMake(0, statusBarHeight, 60, 30)
        Button!.setTitle("分享", forState: UIControlState.Normal)
        Button!.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        Button!.layer.borderColor = UIColor.lightGrayColor().CGColor
        Button!.layer.borderWidth = 1.0
        Button!.titleLabel?.textAlignment = NSTextAlignment.Center
        Button!.addTarget(self, action: Selector("share:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(Button!)
        self.view.bringSubviewToFront(Button!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func share(sender:AnyObject) {
        //准备分享内容，文本图片链接
        let items = ["微信",UIImage(named: "weixin.png")!,NSURL(fileURLWithPath: "https://wx.qq.com")]
        
        let acts = [WeiXinActivity(),WeiBoActivity()]
        //分享视图控制器
        let actView :UIActivityViewController = UIActivityViewController(activityItems: items, applicationActivities: acts)
        // 分享视图要排除的部分分享选项
        actView.excludedActivityTypes = [UIActivityTypeAirDrop,UIActivityTypeCopyToPasteboard,UIActivityTypePostToFlickr,UIActivityTypePostToTencentWeibo,UIActivityTypePostToVimeo,UIActivityTypeSaveToCameraRoll]
        /**
        显示分享视图
        */
        self.presentViewController(actView, animated: true, completion: nil)
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

