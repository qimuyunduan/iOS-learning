//
//  ContactController.swift
//  QQ
//
//  Created by qimuyunduan on 16/3/6.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//


import UIKit

class ContactController: UINavigationController {
    
 
    var searchBar:UISearchBar!
    var searchBarView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func setNavigationBar() {
        
        //设置背景颜色
        let navigationViewHeight = navigationBar.bounds.height
        let navigationView = UIView(frame: CGRectMake(0,0,UIScreen.mainScreen().bounds.size.width,20+navigationViewHeight))
        navigationView.backgroundColor = UIColor(red: 0.49, green: 0.93, blue: 1, alpha: 1)
        view.addSubview(navigationView)
        let leftButton = UIImage(named: "xingxing.png")
        
        let rightButton = "更多"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftButton, style: .Plain, target: self, action:nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: rightButton, style: .Plain, target: self, action: nil)
    }
    func setSearchBar() {
        searchBarView = UIView(frame: CGRectMake(0,0,UIScreen.mainScreen().bounds.width,40))
        searchBarView.backgroundColor = UIColor.clearColor()
        searchBar = UISearchBar()
        searchBar.placeholder = "please into something...."
        searchBar.searchBarStyle = .Minimal
        searchBar.layer.cornerRadius = 5
        searchBarView.addSubview(searchBar)

    }
    func searchBarConstraints() {
    
        let cons1 = NSLayoutConstraint(item: searchBar, attribute: .Top, relatedBy: .Equal, toItem: searchBarView, attribute: .Top, multiplier: 1, constant: 5)
        let cons2 = NSLayoutConstraint(item: searchBar, attribute: .Bottom, relatedBy: .Equal, toItem: searchBarView, attribute: .Bottom, multiplier: 1, constant: -5)
        let cons3 = NSLayoutConstraint(item: searchBar, attribute: .Left, relatedBy: .Equal, toItem: searchBarView, attribute: .Left, multiplier: 1, constant: 5)
        let cons4 = NSLayoutConstraint(item: searchBar, attribute: .Right, relatedBy: .Equal, toItem: searchBarView, attribute: .Right, multiplier: 1, constant: -5)
        
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}