//
//  ChatDataSource.swift
//  MyCustomTableView
//
//  Created by qimuyunduan on 16/2/24.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import Foundation

//数据协议
protocol ChatDataSource {
    //返回对话记录中的全部行数
    func rowsForChatTable(tableView:TableView) -> Int
    //返回某一行的内容
    func chatTableView(tableView:TableView,dataForRow:Int) -> MessageItem

}