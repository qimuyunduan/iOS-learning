//
//  ViewController.swift
//  print
//
//  Created by qimuyunduan on 16/4/10.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func printOne(sender: AnyObject) {
        
        //设置打印控制器
        let printController = UIPrintInteractionController.sharedPrintController()
        
        //设置打印信息
        let printInfo = UIPrintInfo(dictionary: nil)
        printInfo.outputType = UIPrintInfoOutputType.General
        printInfo.jobName = "print text"
        printController.printInfo = printInfo
        //设置打印文本
        let printText = "<div style = 'font-size:28px;font-weight:bold;text-align:center'>"+"使用打印机打印内容</div>"+"使用airprint可以轻松地从ios和osX app中传输文档和照片进行打印"
        //格式化打印文本
        let formatterText = UIMarkupTextPrintFormatter(markupText: printText)
        
        //设置页面边距
        formatterText.contentInsets = UIEdgeInsets(top: 60, left: 60, bottom: 60, right: 60)
        printController.printFormatter = formatterText
        
        //打印
        printController.presentAnimated(true, completionHandler: nil)
        
        
    }
    
    @IBAction func printTwo(sender: AnyObject) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

