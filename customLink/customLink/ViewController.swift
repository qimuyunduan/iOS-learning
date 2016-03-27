//
//  ViewController.swift
//  customLink
//
//  Created by qimuyunduan on 16/3/26.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
extension UITextView {
    //链接文本
    func appendLinkString(string:String,withUrlString:String="") {
        //原来的文本内容
        let attributeString :NSMutableAttributedString = NSMutableAttributedString()
        attributeString.appendAttributedString(self.attributedText)
        
        //新增的文本内容
        let attr = [NSFontAttributeName:self.font!]
        let appendString = NSMutableAttributedString(string: string, attributes: attr)
        //判断是否是链接文字
        if withUrlString != "" {
            let range :NSRange = NSMakeRange(0, appendString.length)
            appendString.beginEditing()
            appendString.addAttribute(NSLinkAttributeName, value: withUrlString, range: range)
            appendString.endEditing()
        }
        //合并新的文本
        attributeString.appendAttributedString(appendString)
        self.attributedText = attributeString
    }

}
class ViewController: UIViewController,UITextViewDelegate {
    

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        textView.text = ""
        textView.center = self.view.center
        textView.appendLinkString("欢迎使用..\n")
        textView.appendLinkString("(1)")
        textView.appendLinkString("查看详细说明",withUrlString: "about:from123\n")
        textView.appendLinkString("(2)")
        textView.appendLinkString("问题反馈", withUrlString: "feedbak:from234")
        // Do any additional setup after loading the view, typically from a nib.
    }
    //响应方法
    func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {
        switch URL.scheme {
        case "about":
            showAlert("about", payload: URL.resourceSpecifier.stringByRemovingPercentEncoding!)
        case "feedback":
            showAlert("feedback", payload: URL.resourceSpecifier.stringByRemovingPercentEncoding!)
        default:
            print("这个是个普通的url")
        }
        return true
    }
    func showAlert(type:String,payload:String) {
        let alertController = UIAlertController(title: "检测到\(type)标签", message: payload, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "确定", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)

        self.presentViewController(alertController, animated: true, completion: nil)
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

