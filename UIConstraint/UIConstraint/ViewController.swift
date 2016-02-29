//
//  ViewController.swift
//  UIConstraint
//
//  Created by qimuyunduan on 16/2/26.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    @IBOutlet var name: UILabel!
    
    @IBOutlet var psw: UILabel!
    
    @IBOutlet var loginName: UITextField!
    
    @IBOutlet var loginPsw: UITextField!
    
    @IBOutlet var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func initView() {
        image.frame = CGRectMake(0, 0, 80, 80)
        image.image = UIImage(named: "11.jpg")
        image.layer.cornerRadius = 40
        image.layer.borderColor = UIColor.yellowColor().CGColor
        image.layer.borderWidth = 1
        
        name.text = "姓名"
        name.frame = CGRectMake(0, 0, 60, 30)
        psw.text = "密码"
        
        loginName.placeholder = "请填写你的姓名"
        loginPsw.placeholder = "请填写密码"
        
        login.backgroundColor = UIColor.blueColor()
        login.frame = CGRectMake(0, 0, self.view.frame.width-20, 30)
        login.setTitle("登录", forState: UIControlState.Normal)
        login.titleLabel?.alpha = 0.5
        login.titleLabel?.textAlignment = NSTextAlignment.Center
        login.titleLabel?.textColor = UIColor.whiteColor()
        login.layer.cornerRadius = 5
        login.center = self.view.center
        
    }
    func setConstraintsForViews() {
        
        let pswCons1 = NSLayoutConstraint(item: psw, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: login, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 20)
        let pswCons2 = NSLayoutConstraint(item: psw, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: login, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        psw.addConstraints([pswCons1,pswCons2])
        let loginPswCons1 = NSLayoutConstraint(item: loginPsw, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: login, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0)
        let loginPswCons2 = NSLayoutConstraint(item: loginPsw, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: psw, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        let loginPswCon3 = NSLayoutConstraint(item: loginPsw, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: psw, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 20)
        loginPsw.addConstraints([loginPswCons1,loginPswCons2,loginPswCon3])
        let nameCons1 = NSLayoutConstraint(item: name, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: psw, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 10)
        let nameCons2 = NSLayoutConstraint(item: name, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: psw, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        let nameCons3 = NSLayoutConstraint(item: name, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: psw, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        let nameCons4 = NSLayoutConstraint(item: name, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: psw, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        name.addConstraints([nameCons1,nameCons2,nameCons3,nameCons4])
        
        
        
        

        
        
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

