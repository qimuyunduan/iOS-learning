//
//  TableView.swift
//  MyCustomTableView
//
//  Created by qimuyunduan on 16/2/24.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
class TableView : UITableView,UITableViewDataSource,UITableViewDelegate {
    
    
    
    //用于保存所有消息
    var chatSections:Array<MessageItem>!
    
    var chatDataSource:ChatDataSource!
    
    
    
    override func reloadData() {
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        var count = 0
        if (self.chatDataSource != nil) {
        
            count = self.chatDataSource.rowsForChatTable(self)
            if (count > 0) {
            
                for i in 0 ..< count {
                    let object = self.chatDataSource.chatTableView(self, dataForRow: i)
                    self.chatSections.append(object)
                
                }
                
            }
            self.chatSections.sortInPlace({
            $0.date.timeIntervalSince1970 < $1.date.timeIntervalSince1970
            })
        
        }
        super.reloadData()
    }
    
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.chatSections = Array<MessageItem>()
        self.backgroundColor = UIColor.clearColor()
        self.separatorStyle = UITableViewCellSeparatorStyle.None
        self.dataSource = self
        self.delegate = self
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section >= self.chatSections.count) {
            return 0
        }
        return self.chatSections.count
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let data = chatSections[indexPath.row]
        return max(data.insets.top+data.view.frame.size.height+data.insets.bottom,52)
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellID = "MSGCell"
        let data = chatSections[indexPath.row]
        let cell = TableViewCell(data:data,reuseIdentifier:cellID)
        return cell
    }
}
