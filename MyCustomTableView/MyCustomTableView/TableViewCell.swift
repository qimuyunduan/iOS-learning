//
//  tableViewCell.swift
//  MyCustomTableView
//
//  Created by qimuyunduan on 16/2/24.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
class TableViewCell : UITableViewCell {
    
    //消息背景
    var contentBackgroundImage : UIImageView!
    //头像
    var personImage :UIImageView!
    //消息数据结构
    var message:MessageItem!
    //消息内容视图
    var chatContentView : UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(data:MessageItem,reuseIdentifier cellID:String) {
        
        self.message = data
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
        rebuildUserInterface()
        
    }
    func rebuildUserInterface() {
        self.selectionStyle = UITableViewCellSelectionStyle.Gray
        if (contentBackgroundImage == nil) {
            
            contentBackgroundImage = UIImageView()
            self.addSubview(contentBackgroundImage)
        }
        //消息类型
        let type = message.mtype
        //消息的宽度
        let width = message.view.frame.size.width
        //消息的高度
        let height = message.view.frame.size.height
        
        var x = (type == ChatType.talker ? 0 : self.frame.size.width - width - message.insets.left - message.insets.right)
        var y : CGFloat = 0
        
        if (self.message.logo != "") {
            
            let logo = message.logo
            personImage = UIImageView(image: UIImage(named: (logo != "" ? logo : "weixin.png")))
            personImage.layer.cornerRadius = 10
            personImage.layer.masksToBounds = true
            personImage.layer.borderColor = UIColor(white: 0.0, alpha: 0.2).CGColor
            personImage.layer.borderWidth = 1.0
            
            //别人头像在左边，我的头像在右边
            let imagePictureX = (type == ChatType.talker) ? 2 : self.frame.size.width - 52
            
            let imagePictureY = height
            
            personImage.frame = CGRectMake(imagePictureX, imagePictureY, 50, 50)
            self.addSubview(personImage)
            
            let delta = self.frame.size.height - (self.message.insets.top+self.message.insets.bottom+self.message.view.frame.height)
            //设置消息内容框的y坐标
            if delta > 0 {
                
                y = delta
                
                
            }
            //设置消息内容框x的坐标
            if (type == ChatType.talker) {
                
                x += 54
                
            }
            if (type == ChatType.Mine) {
                
                x -= 54
            }
            
            
        }
        //设置具体消息消息内容的坐标
        self.chatContentView = self.message.view
        self.chatContentView.frame = CGRectMake(x+self.message.insets.left, y+self.message.insets.top, width, height)
        self.addSubview(self.chatContentView)
        
        //如果是别人的消息 在左边，如果是我输入的消息 在右边
        if (type == ChatType.talker) {
            
            self.contentBackgroundImage.image = UIImage(named: "chat.png")!.stretchableImageWithLeftCapWidth(21, topCapHeight: 14)
            
            
        }
        else {
            self.contentBackgroundImage.image = UIImage(named: "chat.png")!.stretchableImageWithLeftCapWidth(15, topCapHeight: 14)
            
        }
        
        self.contentBackgroundImage.frame = CGRectMake(x, y, width+self.message.insets.left+self.message.insets.right, height+self.message.insets.top+self.message.insets.bottom)
        
        
    }
}