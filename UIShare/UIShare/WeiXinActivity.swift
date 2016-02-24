//
//  WeiXinActivity.swift
//  UIShare
//
//  Created by qimuyunduan on 16/2/24.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class WeiXinActivity : UIActivity {

    var shareText : String!
    var sharePicture : UIImage!
    var shareUrl : NSURL!
    override func activityTitle() -> String? {
        return "微信"
    }
    override func activityImage() -> UIImage? {
        return UIImage(named: "weixin.png")
    }
    /**
     按钮类型 （分享按钮，在第一行，彩色，；动作按钮 在第二行 黑白）
     
     - returns: 动作类型
     */
    override class func activityCategory() -> UIActivityCategory {
        return UIActivityCategory.Share
    }
    /**
     分享类型 可以在UIActivityViewController.completionHandler 回调里可以用于判断，一般取当前类名
     
     - returns:分享类型
     */
    override func activityType() -> String? {
        return WeiXinActivity.self.description()
    }
    /**
     是否显示分享按钮，一般根据用户是否授权，或分享内容是否正确等来决定是否隐藏分享按钮
     
     - parameter activityItems: 分享部分项
     
     - returns: 布尔值
     */
    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        for item in activityItems {
            if item is UIImage {
                return true
            }
            if item is String {
                return true
            }
            if item is NSURL {
                return true
            }
        
        }
        return false
    }
    /**
     解析分享数据时调用，可以进行一定的处理
     
     - parameter activityItems: 分享项的描述
     */
    override func prepareWithActivityItems(activityItems: [AnyObject]) {
        print("prepareWithActivityItems\n")
        for item in activityItems {
            if item is UIImage {
                sharePicture = item as! UIImage
            }
            if item is String {
                shareText = item as! String
            }
            if item is NSURL {
                shareUrl = item as! NSURL
            }
        }
    }
    /**
     执行分享行为，根据应用作相应处理，如：分享到微信或保存数据到照片
     */
    override func performActivity() {
        print("执行分享具体行为...\n")
    }
    /**
     分享时调用
     
     */
    override func activityViewController() -> UIViewController? {
        print("activityViewController\n")
        return nil
        
    }
    /**
     分享完成时调用
     
     - parameter completed:是否完成
     */
    override func activityDidFinish(compsleted: Bool) {
        print("ActivityDidFinish\n")
        
    }
}