//
//  ViewController.swift
//  pageAlamofire
//
//  Created by qimuyunduan on 16/5/15.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    var manager: Alamofire.Manager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加拦截协议
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.protocolClasses!.insert(MyURLProtocol.self, atIndex: 0)
        manager = Manager(configuration: configuration)
       
    }
    
    @IBAction func go(sender: AnyObject) {
        
        if self.textField.isFirstResponder(){
            
            self.textField.resignFirstResponder()
        }
        self.sendRequest()
    }
    
    
    
    //请求数据
    func sendRequest() {
        if let text = self.textField.text {
            manager?.request(.GET, text)
                .responseString(queue: nil, encoding: NSUTF8StringEncoding) { response in
                    self.textView.text = response.result.value
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

