//
//  ViewController.swift
//  UISliderAndUIStepper
//
//  Created by qimuyunduan on 15/11/25.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    
    
    var table:UITableView?
    var items=[]
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
    
        let cell = self.table!.dequeueReusableCellWithIdentifier("Cell")
        cell!.accessoryType = UITableViewCellAccessoryType.DetailDisclosureButton
        cell!.textLabel!.text = self.items.objectAtIndex(indexPath.row) as? String
        return cell!
    
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int
    {
     
        return items.count

    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    
    {
        return 1
    
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.table!.deselectRowAtIndexPath(indexPath, animated: true)
        
        let detailViewController = TableCellView()
        detailViewController.title = self.items.objectAtIndex(indexPath.row)  as? String
        self.navigationController!.pushViewController(detailViewController, animated:true)
    }

    override func viewDidLoad() {
       
        self.title = "customTable"
        self.table = UITableView(frame: self.view.frame,style: UITableViewStyle.Plain)
        self.table?.delegate = self
        self.table?.dataSource = self
        self.items = ["UISlider","UIStepper"]
        self.table?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(self.table!)
        
  
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
