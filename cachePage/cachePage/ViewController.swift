//
//  ViewController.swift
//  cachePage
//
//  Created by qimuyunduan on 16/5/15.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func go(sender: UIButton) {
        if self.textField.isFirstResponder() {
        
            self.textField.resignFirstResponder()
            
        }
        self.sendRequest()
    }
    
    
    //键盘确定按钮点击
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.sendRequest()
        return true
    }
    
    //请求页面
    func sendRequest() {
        if let text = self.textField.text {
            let url = NSURL(string:text)
            let request = NSURLRequest(URL:url!)
            self.webView.loadRequest(request)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

