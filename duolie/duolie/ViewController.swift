//
//  ViewController.swift
//  duolie
//
//  Created by qimuyunduan on 16/3/21.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,GridViewSortDelegate {

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
    //表格排序函数
    func sort(colIndex: Int, asc: Bool, rows: [[AnyObject]]) -> [[AnyObject]] {
        
        let sortedRows = rows.sort {
            
            (firstRow: [AnyObject], secondRow: [AnyObject])-> Bool in
            
            let firstRowValue = firstRow[colIndex] as! String
            let secondRowValue = secondRow[colIndex] as! String
            
            if colIndex == 0 {
                //首例姓名使用字典排序法
                if asc {
                    return firstRowValue < secondRowValue
                }
                
                return firstRowValue > secondRowValue
                
            } else if colIndex == 1 || colIndex == 2 {
                //中间两列使用数字排序
                if asc {
                    return Int(firstRowValue)! < Int(secondRowValue)!
                }
                return Int(firstRowValue)! > Int(secondRowValue)!
            }
            //最后一列数据先去掉百分号，再转成数字比较
            let firstRowValuePercent = Int(firstRowValue.substringToIndex(
                firstRowValue.endIndex.advancedBy(-1)))
            let secondRowValuePercent = Int(secondRowValue.substringToIndex(
                secondRowValue.endIndex.advancedBy(-1)))
            if asc {
                return firstRowValuePercent < secondRowValuePercent
            }
            return firstRowValuePercent > secondRowValuePercent
            
        }
        return sortedRows
    }

}

