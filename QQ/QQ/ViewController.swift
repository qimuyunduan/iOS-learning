//
//  ViewController.swift
//  QQ
//
//  Created by qimuyunduan on 16/3/3.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {
    
    //主页导航控制器
    var mainNavigationController :UINavigationController!
    //主页面控制器
    var mainViewController:MainViewController!
    
    //菜单页控制器
    var menuViewController:MenuViewController!
    //菜单页当前状态
    var currentState = MenuState.Collapsed {
        didSet {
        
        //菜单展开的时候，给主页面边缘添加阴影
            let shouldShowShadow = currentState != .Collapsed
            showShadowForMainViewController(shouldShowShadow)
        }
    
    }
    //菜单打开后主页在屏幕右侧露出部分的宽度
    let menuViewExpandedOffset :CGFloat = 60
    //侧滑开始时，菜单视图起始的偏移量
    let menuViewStartoffset:CGFloat = 70
    //侧滑菜单黑色半透明遮罩层
    var blackCover:UIView?
    //最小缩放比例
    let minProportion :CGFloat = 0.77
 
    override func viewDidLoad() {
        super.viewDidLoad()
        //状态栏文字改成白色
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        //给根容器设置背景
        let imageView = UIImageView(image: UIImage(named: "9.jpg"))
        imageView.frame = UIScreen.mainScreen().bounds
        self.view.addSubview(imageView)
        
        //初始化主视图
        //TODO: add identifier
        mainNavigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("mainNavigation") as! UINavigationController
        
        view.addSubview(mainNavigationController.view)
        
        //指定Navigation Bar 左侧按钮的事件
        mainViewController = mainNavigationController.viewControllers.first as! MainViewController
        mainViewController.navigationItem.leftBarButtonItem?.action = Selector("showMenu")
        
        //添加拖动手势
        let panGes = UIPanGestureRecognizer(target: self, action: "handlePanGesture:")
        mainNavigationController.view.addGestureRecognizer(panGes)
        
        //单击收起菜单手势
        let tapGes = UITapGestureRecognizer(target: self, action: "handleTapGesture:")
        mainNavigationController.view.addGestureRecognizer(tapGes)
        
        
        
        // Do any additional setup after loading the view, typically from a nnilib.
    }
        //导航栏左侧按钮事件响应
    func showMenu() {
    
       //如果菜单是展开的则会收起，否则就展开
        if currentState == .Expanded {
        
            animateMainView(false)
        
        }else {
        
            addMenuViewController()
            animateMainView(true)
        }
    
    
    }
    
    //拖动手势响应
    func handlePanGesture(recognizer:UIPanGestureRecognizer) {
    
        switch(recognizer.state) {
        
            //刚刚开始滑动
        case .Began:
            //判断拖动方向
            let dragFromLeftToRight = (recognizer.velocityInView(view).x > 0 )
            //如果刚刚开始滑动的时候还处在主页面，从左向右滑动加入侧面菜单
            if(currentState == .Collapsed && dragFromLeftToRight) {
            
                currentState == .Expanding
                addMenuViewController()
            }
            //如果是正在滑动，则偏移主视图的坐标实现跟随手指位置移动
        case .Changed:
            let screenWidth = view.bounds.size.width
            var centerX = recognizer.view!.center.x + recognizer.translationInView(view).x
            //页面滑到最左侧的话就不需要继续移动
            if centerX < screenWidth/2 {
                centerX = screenWidth/2
            
            }
            //计算缩放比例
            let percent:CGFloat = (centerX - screenWidth/2) / (view.bounds.size.width - menuViewExpandedOffset)
           let   proportion = 1 - (1 - minProportion) * percent
            
            //执行视觉特效
            blackCover?.alpha = (proportion - minProportion) / (1 - minProportion)
            //主页面滑到最左侧的话就不需要继续移动
            recognizer.view?.center.x = centerX
            recognizer.setTranslation(CGPointZero, inView: view)
            
            //缩放主页面
            
            recognizer.view?.transform = CGAffineTransformScale(CGAffineTransformIdentity, proportion, proportion)
            //菜单视图移动
            menuViewController.view.center.x = screenWidth/2 - menuViewStartoffset * (1-percent)
            //菜单视图缩放
            let menuProportion = (1+minProportion)-proportion
            self.menuViewController?.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,menuProportion,menuProportion)
            
            
            //滑动结束
            
        case .Ended:
            //根据页面滑动是否过半，判断后面是自动展开还是收缩
            let hasMovedHalfway = recognizer.view?.center.x > view.bounds.size.width
            animateMainView(hasMovedHalfway)
        default:
            break
        
        }
    
    }
    
    //单击手势响应
    
    func handleTapGesture() {
    
    
        //如果菜单是展开的点击主页部分则会收起
        if currentState == .Expanded {
        
            animateMainView(false)
        }
    
    }
  
    //添加菜单页
    func addMenuViewController() {
    
        if menuViewController == nil {
        //TODO:
            menuViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("menuView") as? MenuViewController
            //插入当前视图并置顶
            view.insertSubview(menuViewController!.view, belowSubview: mainNavigationController.view)
            //建立父子关系
            addChildViewController(menuViewController)
            menuViewController.didMoveToParentViewController(self)
            
            //在侧滑菜单之上增加黑色遮罩层，目的是实现视觉特效
            blackCover = UIView(frame: CGRectOffset(self.view.frame, 0, 0))
            blackCover?.backgroundColor = UIColor.blackColor()
            self.view.insertSubview(blackCover!, belowSubview: mainNavigationController.view)
        }
    
    
    }
    //主页自动展开，收起动画
    func animateMainView(shouldExpand:Bool) {
    
        //如果是用来展开
        if shouldExpand {
            //更新当前状态
            currentState = .Expanded
            //动画
            let mainPosition = view.bounds.size.width * (1+minProportion/2)-menuViewExpandedOffset
            
            doTheAnimate(mainPosition, mainProportion: minProportion,menuPosition: view.bounds.size.width/2,menuProportion: 1, blackCoverAlpha: 0)

        }
            //如果是用于隐藏
        else {
        
            //动画
            
            let menuPosition = view.bounds.size.width/2 * (1-(1-minProportion)/2)-menuViewStartoffset
            
            doTheAnimate(view.bounds.size.width/2, mainProportion: 1, menuPosition:menuPosition,menuProportion:minProportion,blackCoverAlpha: 1, completion: {
            
                finished in
                //动画结束之后更新状态
                self.currentState = .Collapsed
                
                //移除左侧视图
                self.menuViewController.view.removeFromSuperview()
                
                //释放内存
                //MARK: 很重要.......
                self.menuViewController = nil
                //移除黑色遮罩层
                self.blackCover?.removeFromSuperview()
                
                //释放内存
                self.blackCover = nil

            
            })
        
        
        }
    
    
    }
    
    
    //主页移动动画，黑色遮罩层动画,菜单页移动动画
    
    func doTheAnimate(mainPosition:CGFloat,mainProportion:CGFloat,menuPosition:CGFloat,menuProportion:CGFloat,blackCoverAlpha:CGFloat,completion:((Bool) -> Void)! = nil) {
    
    //1.0 表示没有弹簧震动画面
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
            
            self.mainNavigationController.view.center.x = mainPosition
            self.blackCover?.alpha = blackCoverAlpha
            //缩放主页面
            self.mainNavigationController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, mainProportion, mainProportion)
            //菜单页移动
            self.menuViewController.view.center.x = menuPosition
            //菜单页缩放
            self.menuViewController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, menuProportion, menuProportion)
            
            }, completion: completion)
    
    
    
    }
    //给主页面边缘添加，取消阴影
    
    func showShadowForMainViewController(shouldShowShadow:Bool) {
    
        if shouldShowShadow {
        
            mainNavigationController.view.layer.shadowOpacity = 0.8
        
        }
        else {
        
            mainNavigationController.view.layer.shadowOpacity = 0.0
        }
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    enum MenuState {
    
    case Collapsed
    case Expanding
    case Expanded
    
    }

}

