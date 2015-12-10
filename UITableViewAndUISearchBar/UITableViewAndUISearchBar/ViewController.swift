//
//  ViewController.swift
//  UITableViewAndUISearchBar
//
//  Created by qimuyunduan on 15/11/27.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //展示列表
    var tableView: UITableView!
    var searchBar = UISearchBar()
    //搜索控制器
//    var countrySearchController = UISearchController()
    
    //原始数据集
    let schoolArray = ["清华大学","北京大学","中国人民大学","北京交通大学","北京工业大学",
        "北京航空航天大学","北京理工大学","北京科技大学","中国政法大学","中央财经大学","华北电力大学",
        "北京体育大学","上海外国语大学","复旦大学","华东师范大学","上海大学","河北工业大学"]
    
    //搜索过滤后的结果集
    var searchArray = [String](){
        didSet  {self.tableView.reloadData()}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建表视图
        self.tableView = UITableView(frame: UIScreen.mainScreen().applicationFrame,
            style:UITableViewStyle.Plain)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        tableView.separatorColor = UIColor.lightGrayColor()
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        searchBar.delegate = self
        searchBar.searchBarStyle = UISearchBarStyle.Minimal
        searchBar.sizeToFit()
      
     
        //创建一个重用的单元格
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
        
//        //配置搜索控制器
//        self.countrySearchController = UISearchController(searchResultsController: nil)
//            countrySearchController.searchResultsUpdater = self
//            countrySearchController.hidesNavigationBarDuringPresentation = false
//        //prevent secrch bar from moving
//            countrySearchController.dimsBackgroundDuringPresentation = false
//            countrySearchController.searchBar.searchBarStyle = .Minimal
//            countrySearchController.searchBar.sizeToFit()
//            self.tableView.tableHeaderView = countrySearchController.searchBar
            self.tableView.tableHeaderView = searchBar
     
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension ViewController: UITableViewDataSource
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (self.searchBar.text != "")
        {
            return self.searchArray.count
        } else
        {
            return self.schoolArray.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell
    {
        //为了提供表格显示性能，已创建完成的单元需重复使用
        let identify:String = "SwiftCell"
        //同一形式的单元格重复使用，在声明时已注册
        let cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath)
//        cell.layer.cornerRadius = 5
//        cell.backgroundColor = UIColor.brownColor()
        
        if (self.searchBar.text != "")
        {
            cell.textLabel?.text = self.searchArray[indexPath.row]
            return cell
        }
            
        else
        {
            cell.textLabel?.text = self.schoolArray[indexPath.row]
            return cell
        }
    }
}

extension ViewController: UITableViewDelegate
{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if (self.searchBar.text != "")
        {
            print("你选中了\(searchArray[indexPath.row])")
        }
            
        else
        {
            print("你选择了\(schoolArray[indexPath.row])")
        }
        
    }
}

//extension ViewController: UISearchResultsUpdating
//{
//    func updateSearchResultsForSearchController(searchController: UISearchController)
//    {
//        self.searchArray.removeAll(keepCapacity: false)
//        
//        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@",
//            searchController.searchBar.text!)
//        let array = (self.schoolArray as NSArray).filteredArrayUsingPredicate(searchPredicate)
//        self.searchArray = array as! [String]
//    }
//}
extension ViewController:UISearchBarDelegate {

    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        // 没有搜索内容时显示全部组件
        if searchText == "" {
            self.searchArray = self.schoolArray
        }
        else { // 匹配用户输入内容的前缀
            self.searchArray = []
            for ctrl in self.schoolArray {
                if ctrl.lowercaseString.hasPrefix(searchText) {
                    self.searchArray.append(ctrl)
                }
            }
        }
        // 刷新Table View显示
        self.tableView.reloadData()
    }






}