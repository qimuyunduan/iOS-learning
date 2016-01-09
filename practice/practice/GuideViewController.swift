//
//  GuideViewController.swift
//  practice
//
//  Created by qimuyunduan on 15/12/4.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController,UIScrollViewDelegate {
    
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet var startButton: UIButton!
    let frame = UIScreen.mainScreen().bounds
    
    var numOfPages = 3
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        scrollView.delegate = self
        
        // scrollView的contentSize设为屏幕宽度的4(我这里设了四张引导页)倍
        scrollView.contentSize = CGSizeMake(frame.size.width * CGFloat(numOfPages), frame.size.height)
        
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        
        for i in 0..<numOfPages {
            
            let image = UIImage(named: "Image2")
            let imageView = UIImageView(image: image)
            
            imageView.frame = CGRectMake(frame.size.width * CGFloat(i), 0, frame.size.width, frame.size.height)
            
            scrollView.addSubview(imageView)
        }
        
        scrollView.contentOffset = CGPointZero
        
        self.view.addSubview(scrollView)
        
        startButton.alpha = 0.0
        startButton.addTarget(self, action: "start", forControlEvents: UIControlEvents.TouchUpInside)
        pageControl.frame = CGRectMake(0, 0, 40, 37)
        // 将这两个控件拿到视图的最上面
        self.view.bringSubviewToFront(pageControl)
        self.view.bringSubviewToFront(startButton)
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        // 随着滑动改变pageControl的状态
        pageControl.currentPage = Int(offset.x / view.bounds.width)
        
        // 因为currentPage是从0开始，所以numOfPages减1
        if pageControl.currentPage == numOfPages - 1 {
            
            UIView.animateWithDuration(0.5) {
                self.startButton.alpha = 1.0
            }
            
        } else {
            
            UIView.animateWithDuration(0.5) {
                self.startButton.alpha = 0.0
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Welcome", bundle:NSBundle(forClass: self.dynamicType))
        let viewController = storyboard.instantiateViewControllerWithIdentifier("welcome") as! ViewController
        viewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        presentViewController(viewController, animated: true, completion: nil)
    }
}