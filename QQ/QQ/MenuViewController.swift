//
//  MenuViewController.swift
//  QQ
//
//  Created by qimuyunduan on 16/3/4.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var qianMing: UILabel!
    
    @IBOutlet weak var personImage: UIImageView!
    
    @IBOutlet weak var settingTableView: UITableView!
    
    
    let titlesDictionary = ["开通会员", "QQ钱包", "网上营业厅", "个性装扮", "我的收藏", "我的相册"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = "小小炊烟"
        name.textAlignment = NSTextAlignment.Center
        name.font = UIFont.boldSystemFontOfSize(16)
        qianMing.textAlignment = NSTextAlignment.Center
        qianMing.textColor = UIColor.grayColor()
        qianMing.font = UIFont.systemFontOfSize(14)
        personImage.layer.cornerRadius = 30
        personImage.layer.borderWidth = 1
        personImage.layer.borderColor = UIColor.whiteColor().CGColor
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.backgroundColor = UIColor.blueColor()
        settingTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
       
        
    }
    
    // 处理点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(titlesDictionary[indexPath.row])
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesDictionary.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.None
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel!.text = titlesDictionary[indexPath.row]
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.imageView?.image = UIImage(named: "avator")
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
    
}
