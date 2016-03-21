//
//  GridViewController.swift
//  duolie
//
//  Created by qimuyunduan on 16/3/21.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import Foundation
import UIKit

//表格排序协议
protocol GridViewSortDelegate {
    func sort(colIndex: Int, asc: Bool, rows: [[AnyObject]]) -> [[AnyObject]]
}

class GridViewController: UICollectionViewController {
    //表头数据
    var cols:[String]!      = []
    var rows:[[AnyObject]]! = []
    //排序代理
    var sortDelegate:GridViewSortDelegate!
    //选中的表格列（-1表示没有选中的）
    private var selectedColIndex = -1
    //列排序顺序
    private var asc = true
    //内容居左侧时内边距
    private var paddingLeft:CGFloat = 5
    
    init() {
        
        let layout = GridViewControllerLayout()
        super.init(collectionViewLayout: layout)
        layout.viewController = self
        collectionView?.backgroundColor = UIColor.whiteColor()
        collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.directionalLockEnabled = true
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView?.bounces = false
    
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    //设置列头数据
    func setColumns(columns: [String]) {
        cols = columns
    }
    
    //添加行数据
    func addRow(row: [AnyObject]) {
        rows.append(row)
        collectionView!.collectionViewLayout.invalidateLayout()
        collectionView!.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        collectionView!.frame = CGRectMake(0, 0, view.frame.width, view.frame.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //返回表格总行数
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView)
        -> Int {
            if cols.isEmpty {
                return 0
            }
            //总行数是：记录数＋1个表头
            return rows.count + 1
    }
    
    //返回表格的列数
    override func collectionView(collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            return cols.count
    }
    
    //单元格内容创建
    override func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell",
                forIndexPath: indexPath) as UICollectionViewCell
            //单元格边框
            cell.layer.borderWidth = 1
            cell.backgroundColor = UIColor.whiteColor()
            cell.clipsToBounds = true
            
            //先清空内部原有的元素
            for subview in cell.subviews {
                subview.removeFromSuperview()
            }
            
            //添加内容标签
            let label = UILabel(frame: CGRectMake(0, 0, cell.frame.width,
                cell.frame.height))
            
            //第一列的内容左对齐，其它列内容居中
            if indexPath.row != 0 {
                label.textAlignment = NSTextAlignment.Center
            }else {
                label.textAlignment = NSTextAlignment.Left
                label.frame.origin.x = paddingLeft
            }
            
            //设置列头单元格，内容单元格的数据
            if indexPath.section == 0 {
                let text = NSAttributedString(string: cols[indexPath.row], attributes: [
                    NSFontAttributeName:UIFont.boldSystemFontOfSize(15)
                    ])
                label.attributedText = text
            } else {
                label.font = UIFont.systemFontOfSize(15)
                label.text = "\(rows[indexPath.section-1][indexPath.row])"
            }
            cell.addSubview(label)
            //列排序
            if indexPath.row == selectedColIndex {
                //排序列的单元格背景会变色
                cell.backgroundColor = UIColor(red: 122/255, green: 186/255, blue: 255/255,
                    alpha: 1)
                //排序列列头显示升序降序图标，并调整列头标签相关位置
                
            }
            
            return cell
    }
    
    //单元格选中事件
    override func collectionView(collectionView: UICollectionView,
        didSelectItemAtIndexPath indexPath: NSIndexPath) {
            //打印出点击单元格的［行,列］坐标
            print("点击单元格的[行,列]坐标: [\(indexPath.section),\(indexPath.row)]")
            if indexPath.section == 0 && sortDelegate != nil {
                //如果点击的是表头单元格，则默认该列升序排列，再次点击则变降序排列，以此交替
                asc = (selectedColIndex != indexPath.row) ? true : !asc
                selectedColIndex = indexPath.row
                rows = sortDelegate.sort(selectedColIndex, asc: asc, rows: rows)
                collectionView.reloadData()
            }
    }
}
