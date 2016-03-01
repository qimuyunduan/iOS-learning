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

        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func initView() {
        image = UIImageView()
        
        image!.image = UIImage(named: "11.jpg")
        image!.layer.cornerRadius = 40
        image!.layer.borderColor = UIColor.yellowColor().CGColor
        image!.layer.borderWidth = 1
        image!.layer.masksToBounds = true
        image!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(image!)
        
        name = UILabel()
        name!.text = "姓名"
        name!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(name!)
        psw = UILabel()
        psw!.text = "密码"
        psw!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(psw!)
        
        loginName = UITextField()
        loginName!.placeholder = "请填写你的姓名"
//        loginName!.layer.borderColor = UIColor.greenColor().CGColor
//        loginName!.layer.borderWidth = 0.5
        loginName!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loginName!)
        loginPsw = UITextField()
        loginPsw!.placeholder = "请填写密码"
//        loginPsw!.layer.borderColor = UIColor.greenColor().CGColor
//        loginPsw!.layer.borderWidth = 0.5
        loginPsw!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loginPsw!)
        
        login = UIButton(type: .System)
        login!.backgroundColor = UIColor.greenColor()
        login!.setTitle("登录", forState: UIControlState.Normal)
        login!.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        login!.titleLabel?.alpha = 0.8
        login!.titleLabel?.textAlignment = NSTextAlignment.Center
        login!.layer.cornerRadius = 5
        login!.center.y = self.view.center.y
        login!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(login!)
        
        
        
    }
    func setConstraintsForViews() {
        //为login设置约束
        let loginCons1 = NSLayoutConstraint(item: login!, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 10)
        let loginCons2 = NSLayoutConstraint(item: login!, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: -10)
        let loginCons3 = NSLayoutConstraint(item: login!, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        let loginCons4 = NSLayoutConstraint(item: login!, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        self.view.addConstraints([loginCons1,loginCons2,loginCons3,loginCons4])
        
        //为psw设置约束
        let pswCons1 = NSLayoutConstraint(item: psw!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: login!, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: -20)
        let pswCons2 = NSLayoutConstraint(item: psw!, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: login!, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        let pswCons3 = NSLayoutConstraint(item: psw!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 60)
        let pswCons4 = NSLayoutConstraint(item: psw!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute:.NotAnAttribute, multiplier: 1, constant: 30)
        self.view.addConstraints([pswCons1,pswCons2,pswCons3,pswCons4])
        //为loginPsw设置约束
        let loginPswCons1 = NSLayoutConstraint(item: loginPsw!, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: login!, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0)
        let loginPswCons2 = NSLayoutConstraint(item: loginPsw!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: psw!, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        let loginPswCon3 = NSLayoutConstraint(item: loginPsw!, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: psw!, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 20)
        let loginPswCon4 = NSLayoutConstraint(item: loginPsw!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: psw!, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        
        self.view.addConstraints([loginPswCons1,loginPswCons2,loginPswCon3,loginPswCon4])
        //为name设置约束
        let nameCons1 = NSLayoutConstraint(item: name!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: psw!, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: -20)
        let nameCons2 = NSLayoutConstraint(item: name!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: psw!, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        let nameCons3 = NSLayoutConstraint(item: name!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: psw!, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        let nameCons4 = NSLayoutConstraint(item: name!, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: psw!, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        self.view.addConstraints([nameCons1,nameCons2,nameCons3,nameCons4])
        //为loginName设置约束
        let loginNameCons1 = NSLayoutConstraint(item: loginName!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: loginPsw!, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        let loginNameCons2 = NSLayoutConstraint(item: loginName!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: loginPsw!, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        let loginNameCons3 = NSLayoutConstraint(item: loginName!, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: loginPsw!, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0)
        let loginNameCons4 = NSLayoutConstraint(item: loginName!, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: loginPsw!, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        let loginNameCons5 = NSLayoutConstraint(item: loginName!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: name!, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        self.view.addConstraints([loginNameCons1,loginNameCons2,loginNameCons3,loginNameCons4,loginNameCons5])
        //为image添加约束
        let imageCons1 = NSLayoutConstraint(item: image!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 80)
        let imageCons2 = NSLayoutConstraint(item: image!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 80)
        let imageCons3 = NSLayoutConstraint(item: image!, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem:self.view , attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -160)
        let imageCons4 = NSLayoutConstraint(item: image!, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem:self.view , attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        self.view.addConstraints([imageCons1,imageCons2,imageCons3,imageCons4])
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

