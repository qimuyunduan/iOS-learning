//
//  MessageController.swift
//  QQ
//
//  Created by qimuyunduan on 16/3/6.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class MessageController: UITableViewController {
    
    
    var search : UISearchBar!
    let messages = [[
        "image":"xingxing","name":"xiaoli","message":"你好啊","time":"2天前"
        ],[
        "image":"xingxing","name":"xiaoli方法","message":"你好啊","time":"12天前"
        ],[
        "image":"xingxing","name":"xiao安抚","message":"你好啊问问 ","time":"22天前"
        ],[
        "image":"xingxing","name":"xiao阿迪王","message":"你好为啊","time":"21天前"
        ],[
        "image":"xingxing","name":"xiaol2456与i","message":"你好物权法 啊","time":"22天前"
        ],[
        "image":"xingxing","name":"xiaoli父","message":"你sf好啊","time":"25天前"
        ],[
        "image":"xingxing","name":"xiaol 我i","message":"你vad好啊","time":"2天前"
        ],[
        "image":"xingxing","name":"xiaol千万人完全i","message":"你qrq3r好啊","time":"22天前"
        ]]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        search = UISearchBar()
        search.placeholder = "please input something..."
        self.tableView.tableHeaderView = search
        self.tableView.registerClass(RecentTableViewCell.self, forCellReuseIdentifier: "RecentCell")
        
        
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        <#code#>
    }
    //TODO:
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let Cell = self.tableView.dequeueReusableCellWithIdentifier("RecentCell", forIndexPath: indexPath) as! RecentTableViewCell
        
        
        
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
        UITableViewCellEditingStyle.Delete
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "删除"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}