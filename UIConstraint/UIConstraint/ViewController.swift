//
//  ViewController.swift
//  UIConstraint
//
//  Created by qimuyunduan on 16/2/26.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var image: UIImageView?
    
    var name: UILabel?
    
    var psw: UILabel?
    
    var loginName: UITextField?
    
    var loginPsw: UITextField?
    
    var login: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        setConstraintsForViews()
        adjustImage()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func initView() {
        image = UIImageView()
        image!.frame = CGRectMake(0, 0, 80, 80)
        image!.image = UIImage(named: "11.jpg")
        image!.layer.cornerRadius = 40
        image!.layer.borderColor = UIColor.yellowColor().CGColor
        image!.layer.borderWidth = 1
        image!.layer.masksToBounds = true
        image!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(image!)
        
        name = UILabel()
        name!.text = "姓名"
        name!.frame = CGRectMake(0, 0, 60, 30)
        name!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(name!)
        psw = UILabel()
        psw!.text = "密码"
        psw!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(psw!)
        
        loginName = UITextField()
        loginName!.placeholder = "请填写你的姓名"
        loginName!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loginName!)
        loginPsw = UITextField()
        loginPsw!.placeholder = "请填写密码"
        loginPsw!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loginPsw!)
        
        login = UIButton(type: .System)
        login!.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width-20, 30)
        login!.backgroundColor = UIColor.greenColor()
        login!.setTitle("登录", forState: UIControlState.Normal)
        login!.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        login!.titleLabel?.alpha = 0.8
        login!.titleLabel?.textAlignment = NSTextAlignment.Center
        login!.layer.cornerRadius = 5
        login!.center = self.view.center
        login!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(login!)
        let loginCons1 = NSLayoutConstraint(item: login!, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 20)
        login!.addConstraint(loginCons1)
        
    }
    func setConstraintsForViews() {
        
        
        
        //为psw设置约束
        let pswCons1 = NSLayoutConstraint(item: psw!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: login!, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: -20)
        let pswCons2 = NSLayoutConstraint(item: psw!, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: login!, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        psw!.addConstraints([pswCons1,pswCons2])
        //为loginPsw设置约束
        let loginPswCons1 = NSLayoutConstraint(item: loginPsw!, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: login!, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0)
        let loginPswCons2 = NSLayoutConstraint(item: loginPsw!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: psw!, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        let loginPswCon3 = NSLayoutConstraint(item: loginPsw!, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: psw!, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 20)
        let loginPswCon4 = NSLayoutConstraint(item: loginPsw!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: psw!, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        
        loginPsw!.addConstraints([loginPswCons1,loginPswCons2,loginPswCon3,loginPswCon4])
        //为name设置约束
        let nameCons1 = NSLayoutConstraint(item: name!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: psw!, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: -10)
        let nameCons2 = NSLayoutConstraint(item: name!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: psw!, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        let nameCons3 = NSLayoutConstraint(item: name!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: psw!, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        let nameCons4 = NSLayoutConstraint(item: name!, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: psw!, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        name!.addConstraints([nameCons1,nameCons2,nameCons3,nameCons4])
        //为loginName设置约束
        let loginNameCons1 = NSLayoutConstraint(item: loginName!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: loginPsw!, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        let loginNameCons2 = NSLayoutConstraint(item: loginName!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: loginPsw!, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        let loginNameCons3 = NSLayoutConstraint(item: loginName!, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: loginPsw!, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0)
        let loginNameCons4 = NSLayoutConstraint(item: loginName!, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: loginPsw!, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        let loginNameCons5 = NSLayoutConstraint(item: loginName!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: name!, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        loginName!.addConstraints([loginNameCons1,loginNameCons2,loginNameCons3,loginNameCons4,loginNameCons5])
        
    }
    /**
     调整image位置
     */
    func adjustImage() {
        
        image!.center.x = self.view.center.x
        image!.center.y = name!.center.y-60
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

