//
//  ViewController.swift
//  Seague
//
//  Created by qimuyunduan on 16/2/23.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var tasks = ["task 1 ","task 2"," task 3"]
    var tableViewTask : UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewTask = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        tableViewTask?.delegate = self
        tableViewTask?.dataSource = self
        tableViewTask?.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        tableViewTask?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(tableViewTask!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = (tableViewTask?.dequeueReusableCellWithIdentifier("Cell"))! as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.None
        cell.textLabel?.text = tasks[indexPath.row]
        cell.textLabel?.textAlignment = NSTextAlignment.Left
        return cell
    }
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    /**
     处理表格单元格选中事件
     
     - parameter tableView: 表格
     - parameter indexPath: 表格单元格所在行
     */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableViewTask?.deselectRowAtIndexPath(indexPath, animated: true)
        let itemValue = tasks[indexPath.row]
        /**
        seague 携带的信息
        
        - parameter sender: 被携带的信息
        */
        self.performSegueWithIdentifier("showDetailView", sender: itemValue)
    }
    /**
     segue 跳转前准备工作
     
     - parameter segue:  segue
     - parameter sender: 被携带的信息
     */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetailView" {
            /// 设置segue的目的控制器
            let desController = segue.destinationViewController as! DetailViewController
            desController.itemValue  = sender as? String
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

