//
//  UIImageCopy.swift
//  UIPasteboard
//
//  Created by qimuyunduan on 16/3/13.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class UIImageCopy: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInt()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func sharedInt() {
    
        userInteractionEnabled = true
        addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: "showMenu:"))
    
    }
    func showMenu(sender:AnyObject?) {
    
        becomeFirstResponder()
        let menu = UIMenuController.sharedMenuController()
        
        if !menu.menuVisible {
            menu.setTargetRect(bounds, inView: self)
            menu.setMenuVisible(true, animated: true)
        }
    
    }
    override func copy(sender: AnyObject?) {
        let pasteBoard = UIPasteboard.generalPasteboard()
        pasteBoard.image = image
//        let menu = UIMenuController.sharedMenuController()
//        menu.setMenuVisible(true, animated: true)
    }
    override func paste(sender: AnyObject?) {
        let pasteBoard = UIPasteboard.generalPasteboard()
        self.image = pasteBoard.image
//        let menu = UIMenuController.sharedMenuController()
//        menu.setMenuVisible(true, animated: true)
//        
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        if action == "copy:" || action == "paste:" {
            return true
        
        }
        return false
    }
}
