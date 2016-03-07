//
//  PhoneController.swift
//  QQ
//
//  Created by qimuyunduan on 16/3/6.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class PhoneController: UITableViewController {
    
    
    var search : UISearchBar!
    var messages = [[
        "image":"xingxing.png","name":"xiaoli","message":"你好啊","time":"2天前"
        ],[
            "image":"xingxing.png","name":"xiaoli方法","message":"你好啊","time":"12天前"
        ],[
            "image":"xingxing.png","name":"xiao安抚","message":"你好啊问问 ","time":"22天前"
        ],[
            "image":"xingxing.png","name":"xiao阿迪王","message":"你好为啊","time":"21天前"
        ],[
            "image":"xingxing.png","name":"xiaol2456与i","message":"你好物权法 啊","time":"22天前"
        ],[
            "image":"xingxing.png","name":"xiaoli父","message":"你sf好啊","time":"25天前"
        ],[
            "image":"xingxing.png","name":"xiaol 我i","message":"你vad好啊","time":"2天前"
        ],[
            "image":"xingxing.png","name":"xiaol千万人完全i","message":"你qrq3r好啊","time":"22天前"
        ]]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        search = UISearchBar()
        search.placeholder = "please input something..."
        self.tableView.tableHeaderView = search
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .SingleLine
        tableView.separatorColor = UIColor.lightGrayColor()
        self.tableView.registerClass(RecentTableViewCell.self, forCellReuseIdentifier: "RecentCell")
        
        
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let Cell = self.tableView.dequeueReusableCellWithIdentifier("RecentCell", forIndexPath: indexPath) as! RecentTableViewCell
        Cell.accessoryType = UITableViewCellAccessoryType.None
        Cell.person.image = UIImage(contentsOfFile:messages[indexPath.row]["image"]!)
        Cell.name.text = messages[indexPath.row]["name"]!
        Cell.message.text = messages[indexPath.row]["message"]!
        Cell.time.text  = messages[indexPath.row]["message"]!
        return Cell
        
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .Default, title: "删除", handler: {
            _,indexPath in
            
            self.messages.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            
        })
        delete.backgroundColor = UIColor.yellowColor()
        
        let setToTop = UITableViewRowAction(style: .Default, title: "置顶", handler:{
            _,indexPath in
            let message = self.messages[indexPath.row]
            self.messages.removeAtIndex(indexPath.row)
            self.messages.insert(message, atIndex: 0)
            tableView.moveRowAtIndexPath(indexPath, toIndexPath: NSIndexPath(index: 0))
            
        })
        setToTop.backgroundColor = UIColor.blueColor()
        return [delete,setToTop]
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
