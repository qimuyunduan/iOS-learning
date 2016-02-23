//
//  ViewController.swift
//  tableView
//
//  Created by qimuyunduan on 16/2/22.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate,UISearchBarDelegate {
    
    var tableView : UITableView?
    var searchBar : UISearchBar?
    var indexHeaders:[String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    var ctrlNames :[String] = ["Label 标签","Button 按钮","DatePiker 日期选择器","TableView 表格视图","Button 按钮","DatePiker 日期选择器"]
    var matchNames :[String] = []
    var headerView : UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        matchNames = ctrlNames
        tableView = UITableView(frame: UIScreen.mainScreen().applicationFrame, style: UITableViewStyle.Plain)
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(tableView!)
        tableView?.separatorColor = UIColor.blueColor()
        tableView?.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        tableView?.showsHorizontalScrollIndicator = false
        //索引文本颜色
        tableView!.sectionIndexColor = UIColor.grayColor()
        tableView!.sectionIndexBackgroundColor = UIColor.whiteColor()
        //点击索引时的背景颜色
        tableView!.sectionIndexTrackingBackgroundColor = UIColor.redColor()
  
        addTableHeaderView()
        let longPress = UILongPressGestureRecognizer(target: self, action: Selector("cellLongPressed:"))
        longPress.delegate = self
        longPress.minimumPressDuration = 1.0
        tableView?.addGestureRecognizer(longPress)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return indexHeaders.count
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("你选中了"+ctrlNames[indexPath.row]+"...\n")
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID:String = "Cell"
        /// 重复使用同一形式的单元格
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.None
        cell.textLabel?.text = matchNames[indexPath.row]
        cell.imageView?.image = UIImage(named: "11.png")
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchNames.count
    }
    
    /**
     表格长按事件处理函数
     
     - parameter gestureRecognizer: 长按手势识别器
     */
    func cellLongPressed(gestureRecognizer:UILongPressGestureRecognizer) {
        
        if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            if tableView?.editing == false {
                tableView?.setEditing(true, animated: true)
            }
            else {
                tableView?.setEditing(false, animated: true)
            }
        }
    }
    /**
     移动表格单元格函数
     
     - parameter tableView:            单元格
     - parameter sourceIndexPath:      要移动的单元格
     - parameter destinationIndexPath: 单元格的目的位置
     */
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        if sourceIndexPath != destinationIndexPath {
            let cellValue = matchNames[sourceIndexPath.row]
            matchNames.removeAtIndex(sourceIndexPath.row)
            if (destinationIndexPath.row > matchNames.count) {
                self.matchNames.append(cellValue)
                
            }
            else {
                
                self.matchNames.insert(cellValue, atIndex: destinationIndexPath.row)
            }
        }
    }
    /**
     是否可以移动单元格
     
     - parameter tableView: 表格
     - parameter indexPath: 单元格所在行
     
     - returns: 布尔值是否准许移动
     */
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    /**
     为表格添加表头视图
     
     - returns: 表头视图
     */
    func addTableHeaderView()  {
        let searchBarWidth =  tableView?.frame.width
        headerView = UIView(frame: CGRectMake(0,0,searchBarWidth!,40))
        headerView!.backgroundColor = UIColor.grayColor()
        searchBar = UISearchBar(frame: CGRectMake(0,10,searchBarWidth!,20))
        searchBar?.placeholder = "请输入相关内容"
        searchBar?.delegate = self
        searchBar?.backgroundColor = UIColor.whiteColor()
        headerView!.addSubview(searchBar!)
        headerView!.center = searchBar!.center
        tableView?.tableHeaderView = headerView
    }
    /**
     searchBar 代理方法，每次改变内容都会调用
     
     - parameter searchBar:  搜索条
     - parameter searchText: 搜索文字
     */
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            
            matchNames = ctrlNames
        }
        else {
            matchNames = []
            for itemValue in self.ctrlNames {
                
                if (itemValue.lowercaseString.containsString(searchText)) {
                    matchNames.append(itemValue)
                }
            }
            
        }
        tableView!.reloadData()
    }
    
    
    /**
     设置del的文字信息
     
     - parameter tableView: <#tableView description#>
     - parameter indexPath: <#indexPath description#>
     
     - returns: 删除
     */
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "删除"
    }
    /**
     编辑单元格触发的具体操作
     
     - parameter tableView:    表格
     - parameter editingStyle: 编辑样式
     - parameter indexPath:    待编辑表格单元格信息
     */
     /**
     是否可以编辑表格
     
     - parameter tableView: <#tableView description#>
     - parameter indexPath: <#indexPath description#>
     
     - returns: <#return value description#>
     */
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            matchNames.removeAtIndex(indexPath.row)
            tableView.reloadData()
            tableView.setEditing(true, animated: true)
        
        }
    }
    /**
     search Button 触发事件
     
     - parameter searchBar: 搜索条
     */
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
    }
    /**
     为表格设置区域索引数据源
     
     - parameter tableView: 表格
     
     - returns: 索引数组
     */
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return indexHeaders
    }
    /**
     点击索引数据，移动tableView section 位置
     
     - parameter tableView: 表格
     - parameter title:     索引值
     - parameter index:     索引值所在的位置
     
     - returns: 返回项目所在位置
     */
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        
        var itemAtIndex = 0
        for indexValue in indexHeaders {
            if (indexValue == title) {
            return itemAtIndex
            }
            else {
            itemAtIndex++
            }
            
        }
        return 0
    }
    /**
     该方法确定分区的头部
     
     - parameter tableView: 表格
     - parameter section:   表格的头部
     
     - returns: 指定分区的title
     */
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      
        return indexHeaders[section]
    }
    
//    func tableview
    /**
     设置分区的高度
     
     - parameter tableView: 表格
     - parameter section:   表格区域
     
     - returns: 分区的高度
     */
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    /**
     设置表格页脚的高度
     
     - parameter tableView: 表格
     - parameter section:   表格页脚
     
     - returns: 页脚高度
     */
//    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 15
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

