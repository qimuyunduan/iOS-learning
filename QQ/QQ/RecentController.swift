//
//  RecentController.swift
//  QQ
//
//  Created by qimuyunduan on 16/3/6.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
class RecentController: UINavigationController {
    
    
    @IBOutlet weak var messageContainerView: UIView!
    
    @IBOutlet weak var phoneContainView: UIView!
    var titleView : UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        setNavigationBar()
        //设置视图的初始状态
        messageContainerView.hidden = false
        phoneContainView.hidden = true
        
        // Do any additional setup after loading the view.
    }
    
    
    func setNavigationBar() {
        
        let segmentSelection = ["消息","电话"]
        //设置背景颜色
        let navigationView = UIView(frame: CGRectMake(0,0,UIScreen.mainScreen().bounds.size.width,60))
        navigationView.backgroundColor = UIColor(red: 0.49, green: 0.93, blue: 1, alpha: 1)
        view.addSubview(navigationView)
        //设置navigationBar左侧按钮
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "xingxing"), style:.Plain, target: self, action: Selector("showMenuView"))
        self.navigationItem.setLeftBarButtonItem(leftBarButtonItem, animated: true)
        //设置navigationBar的titleView
        titleView = UISegmentedControl(items: segmentSelection)
        titleView.tintColor = UIColor.whiteColor()
        titleView.selectedSegmentIndex = 0
        titleView.addTarget(self, action: Selector("indexChanged"), forControlEvents: UIControlEvents.ValueChanged)
        self.navigationItem.titleView = titleView
        
        let rightButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: nil)
        self.navigationItem.setRightBarButtonItem(rightButtonItem, animated: true)
        
        
    }
    
    
    //监听titleView的valueChanged方法
    func indexChanged() {
        
        if titleView.selectedSegmentIndex == 0 {
            
            messageContainerView.hidden = false
            messageContainerView.hidden = true
            
        }
        else {
            
            messageContainerView.hidden = true
            messageContainerView.hidden = false
            
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
