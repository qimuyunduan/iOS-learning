//
//  ViewController.swift
//  MyCustomTableView
//
//  Created by qimuyunduan on 16/2/24.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ChatDataSource {
    var chats:Array<MessageItem>!
    var tableView:TableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpChatTable()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func setUpChatTable() {
    
        self.tableView = TableView(frame:CGRectMake(0,20,self.view.frame.size.width,self.view.frame.size.height-20),style:.Plain)
        self.tableView!.registerClass(TableViewCell.self,forCellReuseIdentifier:"MSGCell")
        let me = "11.png"
        let talker = "5.jpg"
        let one =  MessageItem(body:"嘿，这张照片咋样，我周末拍的呢！", logo:me,
            date:NSDate(timeIntervalSinceNow:-600), mtype:ChatType.Mine)
        
        let two =  MessageItem(image:UIImage(named:"11.png")!,logo:me,
            date:NSDate(timeIntervalSinceNow:-290), mtype:ChatType.Mine)
        
        let three =  MessageItem(body:"太赞了，我也想去那看看呢！",logo:talker,
            date:NSDate(timeIntervalSinceNow:-60), mtype:ChatType.talker)
        
        let four =  MessageItem(body:"嗯，下次我们一起去吧！",logo:me,
            date:NSDate(timeIntervalSinceNow:-20), mtype:ChatType.Mine)
        
        let five =  MessageItem(body:"好的，一定！",logo:talker,
            date:NSDate(timeIntervalSinceNow:0), mtype:ChatType.talker)
        
        chats = [one,two,three,four,five]
        self.tableView.chatDataSource = self
        self.tableView.reloadData()
        self.view.addSubview(tableView)
    
    }
    
    // 实现ChatDataSource 协议
    func rowsForChatTable(tableView:TableView) -> Int {
    
        return self.chats.count
    
    }
    func chatTableView(tableView:TableView,dataForRow row :Int) -> MessageItem {
    
        return chats[row]
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

