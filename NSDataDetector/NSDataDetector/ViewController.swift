//
//  ViewController.swift
//  NSDataDetector
//
//  Created by qimuyunduan on 16/3/27.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let str = "欢迎访问https://www.baidu.com.http://www.youku.com\n ftp://tudou.com"
        print("测试字符串式:\n\(str)\n")
        print("匹配到的链接:")
        let urls = getUrls(str)
        for url in urls {
            print(url)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    private func getUrls(str:String) -> [String] {
        var urls = [String]()
        do{
            let dataDetector = try NSDataDetector(types:NSTextCheckingType.Link.rawValue)
            let res = dataDetector.matchesInString(str, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0,str.characters.count))
            
            for checkingRes in res {
                
                urls.append((str as NSString).substringWithRange(checkingRes.range))

            }
        }
        catch {
            
            print (error)
        
        }
        return urls
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

