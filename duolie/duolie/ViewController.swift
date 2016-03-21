//
//  ViewController.swift
//  duolie
//
//  Created by qimuyunduan on 16/3/21.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gridViewController: GridViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gridViewController = GridViewController()
        gridViewController.setColumns(["客户", "消费金额", "消费次数", "满意度"])
        gridViewController.addRow(["hangge", "100", "8", "60%"])
        gridViewController.addRow(["张三", "223", "16", "81%"])
        gridViewController.addRow(["李四", "143", "25", "93%"])
        gridViewController.addRow(["王五", "75", "2", "53%"])
        gridViewController.addRow(["韩梅梅", "43", "12", "33%"])
        gridViewController.addRow(["李雷", "33", "27", "45%"])
        gridViewController.addRow(["王大力", "33", "22", "15%"])
        view.addSubview(gridViewController.view)
    }
    
    override func viewDidLayoutSubviews() {
        gridViewController.view.frame = CGRectMake(0, 50, view.frame.width,
            view.frame.height-60)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

