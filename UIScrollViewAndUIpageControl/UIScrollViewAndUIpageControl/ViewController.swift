//
//  ViewController.swift
//  UIScrollViewAndUIpageControl
//
//  Created by qimuyunduan on 15/11/26.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    
    
    let imageScroll = UIScrollView()
    let pageControl = UIPageControl()
    let button = UIButton(type: UIButtonType.System)
    
    func initScrollView()
    {
        
        
        imageScroll.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        imageScroll.contentSize = CGSizeMake(self.view.frame.width * CGFloat(3), self.view.frame.height)
        imageScroll.contentOffset = CGPointZero
        imageScroll.delegate = self
        imageScroll.showsHorizontalScrollIndicator = false
        imageScroll.showsVerticalScrollIndicator = false
        imageScroll.scrollsToTop = false
        imageScroll.pagingEnabled = true
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.backgroundColor = UIColor.yellowColor()
        pageControl.center.x = self.view.center.x
        pageControl.center.y = self.view.center.y * CGFloat(1.5)
        pageControl.bounds = CGRectMake(0, 0, 60, 30)
        button.center = self.view.center
        button.bounds = CGRectMake(0, 0, 100, 50)
        button.backgroundColor = UIColor.blueColor()
        button.setTitle("进入体验", forState: UIControlState.Normal)
        button.alpha = 0.0
        button.addTarget(self, action: "enterApp", forControlEvents: UIControlEvents.TouchUpInside)
        for i in 0..<3 {
            
            let image = UIImage(named: "\(i+1).png")
            let myImageView = UIImageView(frame:CGRectMake(self.view.frame.width * CGFloat(i) , 0, self.view.frame.width, self.view.frame.height))
            myImageView.image = image
            imageScroll.addSubview(myImageView)
            
            
            
        }
        
        
        
        
        
        self.view.addSubview(pageControl)
        self.view.addSubview(imageScroll)
        self.view.addSubview(button)
        self.view.bringSubviewToFront(pageControl)
        self.view.bringSubviewToFront(button)
        
    }
    
    func enterApp() {
        
        let loginStory = UIStoryboard(name: "App", bundle:nil)
        
        let loginViewController = loginStory.instantiateViewControllerWithIdentifier("app") as! LoginViewController
        
        self.presentViewController(loginViewController, animated: true, completion: nil)
        
        
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let currentPage = Int(scrollView.contentOffset.x/self.view.bounds.width)
        
        pageControl.currentPage = currentPage
        print(currentPage)
        
        if currentPage == 2 {
            UIView.animateWithDuration(0.5)
                {
                    self.button.alpha = 1.0
            }
            
        }
        else{
            
            self.button.alpha = 0.0
        }
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initScrollView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

