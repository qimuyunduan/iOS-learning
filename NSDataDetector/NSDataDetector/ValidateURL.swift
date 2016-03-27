//
//  ValidateURL.swift
//  NSDataDetector
//
//  Created by qimuyunduan on 16/3/27.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
class ValidateURL: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let str = "欢迎 访问 http://www.youku.com"
        print(str)
        print(verifyURL(str))
        print(verify(str))
        
        let sstr = "http://www.tudou.com"
        print(sstr)
        print(verifyURL(sstr))
        print(verify(sstr))
    }
    //验证url有效性1
    func verifyURL(str:String) -> Bool  {
        
        do {
            let dataDetector = try NSDataDetector(types: NSTextCheckingType.Link.rawValue)
            
            let res = dataDetector.matchesInString(str, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, str.characters.count))
            
            if res.count == 1 && res[0].range.location == 0 && res[0].range.length == str.characters.count {
                return true
            }
        
        }
        catch {
            print(error)
        }
        return false
    }
    //验证url有效性
    func verify(str:String) -> Bool {
        if let url = NSURL(string: str) {
        return UIApplication.sharedApplication().canOpenURL(url)
        }
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
