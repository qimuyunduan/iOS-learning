//
//  MessageItem.swift
//  MyCustomTableView
//
//  Created by qimuyunduan on 16/2/24.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

enum ChatType {

    case Mine
    case talker
}
/// 消息体数据结构
class MessageItem {
    //头像
    var logo:String
    //消息发送时间
    var date:NSDate
    //消息类型
    var mtype:ChatType
    //内容视图
    var view:UIView
    //边距
    var insets:UIEdgeInsets
    /**
     设置文本消息边距
    
     */
    class func getTextInsetsMine() ->UIEdgeInsets {
    
        return UIEdgeInsets(top: 5, left: 10, bottom: 11, right: 17)
    
    }
    //设置对方的文本消息边距
    class func getTextInsetsTalker() ->UIEdgeInsets {
       
        return UIEdgeInsets(top: 5, left: 15, bottom: 11, right: 10)
    
    }
    
    //设置我的图片消息边距
    class func getImageInsetsMine() ->UIEdgeInsets {
    
        return UIEdgeInsets(top: 11, left: 13, bottom: 16, right: 22)
    
    }
    //设置对方图片消息边距
    class func getImageInsetsTalker() ->UIEdgeInsets {
    
        return UIEdgeInsets(top: 11, left: 13, bottom: 16, right: 22)

    }
    
    //构造文本消息体
    convenience init(body:NSString,logo:String,date:NSDate,mtype:ChatType) {
        
        let font = UIFont.boldSystemFontOfSize(12)
        let width = 225, height = 0
        let atts = [NSFontAttributeName:font]
        let size = body.boundingRectWithSize(CGSizeMake(CGFloat(width), CGFloat(height)), options: .UsesLineFragmentOrigin, attributes: atts, context: nil)
        let label = UILabel(frame: CGRectMake(0,0,size.size.width,size.size.height))
        print(""+String(size.size.width)+"\n"+String(size.size.height))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.text = (body.length != 0 ? body as String : "")
        label.font = font
        label.backgroundColor = UIColor.lightGrayColor()
        let insets:UIEdgeInsets = (mtype == ChatType.Mine ? MessageItem.getTextInsetsMine() : MessageItem.getTextInsetsTalker())
        self.init(logo:logo,date:date,mtype:mtype,view:label,insets:insets)
        
    }
    init(logo:String,date:NSDate,mtype:ChatType,view:UIView,insets:UIEdgeInsets) {
    
        self.logo = logo
        self.date = date
        self.mtype = mtype
        self.view = view
        self.insets = insets
    
    
    }
    //构造图片消息图体
    
    convenience init(image:UIImage,logo:String,date:NSDate,mtype:ChatType) {
        //等比例缩放
        var size = image.size
        if (size.width > 200) {
            size.height /= (size.width / 200)
            size.height = 200
        }
        let imageView = UIImageView(frame: CGRectMake(0,0, size.width, size.height))
        imageView.image = image
        imageView.layer.cornerRadius = 5.0
        imageView.layer.masksToBounds = true
        let insets : UIEdgeInsets = (mtype == ChatType.Mine ? MessageItem.getImageInsetsMine() : MessageItem.getImageInsetsTalker())
        self.init(logo:logo,date:date,mtype:mtype,view:imageView,insets:insets)
        
        
        
    }

}