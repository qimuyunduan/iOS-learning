//
//  ViewController.swift
//  print
//
//  Created by qimuyunduan on 16/4/10.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPrintInteractionControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
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
        
        // 打印控制器
        let printController = UIPrintInteractionController.sharedPrintController()
        // 打印任务相关信息
        let printInfo = UIPrintInfo(dictionary:nil)
        printInfo.outputType = UIPrintInfoOutputType.General
        printInfo.jobName = "print two"
        printController.printInfo = printInfo
        
        //设置打印文本
        let printText = "<table width='100%' id='table1' border='1' cellspacing='0'"
            + "cellpadding='3' style='font-size:12px;border-collapse: collapse; "
            + "margin: 0px 0px 1em; padding: 0px; border-spacing: 0px;'>"
            + "<tbody>"
            + "<tr>"
            + "<td rowspan='2' style='margin: 0px; padding: 0px; text-align: center;'"
            + " width='30'>排名</td>"
            + "<td rowspan='2' style='margin: 0px; padding: 0px; text-align: center;'"
            + ">校名</td>"
            + "<td rowspan='2' style='margin: 0px; padding: 0px; text-align: center;'"
            + " width='50'>总得分</td>"
            + "<td colspan='2' style='margin: 0px; padding: 0px; text-align: center;'"
            + ">人才培养</td>"
            + "<td style='margin: 0px; padding-left: 5px;'></td>"
            + "<td colspan='2' style='margin: 0px; padding: 0px; text-align: center;'"
            + ">科学研究</td>"
            + "<td style='margin: 0px; padding-left: 5px;'></td>"
            + "<td colspan='2' rowspan='2' style='margin: 0px; padding: 0px; "
            + "text-align: center;'>学校参考类型</td>"
            + "</tr>"
            + "<tr>"
            + "<td style='margin: 0px; text-align: center;'>得分</td>"
            + "<td style='margin: 0px; text-align: center;'>研究生培养</td>"
            + "<td style='margin: 0px; text-align: center;'>本科生培养</td>"
            + "<td style='margin: 0px; text-align: center;'>得分</td>"
            + "<td style='margin: 0px; text-align: center;'>自然科学研究</td>"
            + "<td style='margin: 0px; text-align: center;'>社会科学研究</td>"
            + "</tr>"
            + "<tr>"
            + "<td style='margin: 0px; padding-left: 5px;'>1</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>清华大学</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>222.89</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>100.13</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>68.48</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>31.65</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>122.76</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>97.19</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>25.57</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>综合类</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>研究1型</td>"
            + "</tr>"
            + "<tr>"
            + "<td style='margin: 0px; padding-left: 5px;'>2</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>浙江大学</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>221.02</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>96.24</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>69.87</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>26.37</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>124.78</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>106.85</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>17.92</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>理科类</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>研究1型</td>"
            + "</tr>"
            + "<tr>"
            + "<td style='margin: 0px; padding-left: 5px;'>3</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>北京大学</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>220.99</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>97.93</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>69.47</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>28.46</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>123.06</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>82.69</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>40.38</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>综合类</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>研究1型</td>"
            + "</tr>"
            + "<tr>"
            + "<td style='margin: 0px; padding-left: 5px;'>4</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>上海交通大学</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>168.81</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>75.49</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>53.35</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>22.14</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>93.31</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>82.11</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>11.20</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>理科类</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>研究1型</td>"
            + "</tr>"
            + "<tr>"
            + "<td style='margin: 0px; padding-left: 5px;'>5</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>复旦大学</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>152.48</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>66.57</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>48.47</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>18.10</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>85.91</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>63.00</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>22.91</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>综合类</td>"
            + "<td style='margin: 0px; padding-left: 5px;'>研究1型</td>"
            + "</tr>"
            + "</tbody>"
            + "</table>"
        
        // 格式化打印文本
        let formatter = UIMarkupTextPrintFormatter(markupText: printText)
        // 设置页面Insets边距
        formatter.contentInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        printController.printFormatter = formatter
        // 提供打印界面让用户选择打印机和副本的数量
        printController.presentAnimated(true, completionHandler: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

