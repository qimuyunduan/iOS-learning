//
//  ViewController.swift
//  UIRefreshControl
//
//  Created by qimuyunduan on 16/2/27.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var cells :[articles] = [articles]()
    //刷新控制器
    @IBOutlet weak var tableView: UITableView!
    
    var refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.frame = self.view.frame
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        refreshControl.addTarget(self, action: "refreshData", forControlEvents: UIControlEvents.ValueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "刷新...")
        refreshControl.backgroundColor = UIColor.brownColor()

        self.tableView!.addSubview(refreshControl)
        refreshData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //刷新数据
    func refreshData() {
        self.cells.removeAll()
        
        for i in 0..<5 {
            let article = articles(articleTitle: "news"+String(i), articleDate: NSDate())
            cells.append(article)
         
        
        }
        self.tableView!.reloadData()
        //加载完毕后，停止刷新
        refreshControl.endRefreshing()
        
    
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
 
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        let article = cells[indexPath.row] as articles
        myCell.textLabel!.text = article.articleTitle
        
        let dateFormat = NSDateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateStr = dateFormat.stringFromDate(article.articleDate)
        myCell.detailTextLabel!.text = dateStr
        
        return myCell
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    struct articles {
    
        var articleTitle :String
        var articleDate : NSDate
    
    }
}

