//
//  UILabelCopy.swift
//  UIPasteboard
//
//  Created by qimuyunduan on 16/3/12.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
class UILabelCopy:UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    func sharedInit() {
    
        userInteractionEnabled = true
        addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: Selector("showMenu:")))

    }
    
    func showMenu(sender:AnyObject) {
    
        becomeFirstResponder()
        let menu = UIMenuController.sharedMenuController()
        if !menu.menuVisible {
            menu.setTargetRect(bounds, inView: self)
            menu.setMenuVisible(true, animated: true)
        
        }
    
    }
    //复制功能
    
    override func copy(sender: AnyObject?) {
        let pasteBoard = UIPasteboard.generalPasteboard()
        pasteBoard.string = text
        //点击复制后，菜单是否消失
//        let menu = UIMenuController.sharedMenuController()
//        menu.setMenuVisible(true, animated: true)
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        if action == "copy:" {
            return true
        }
        return false
    }
    
}
