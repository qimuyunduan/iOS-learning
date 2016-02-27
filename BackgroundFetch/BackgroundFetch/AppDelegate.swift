//
//  AppDelegate.swift
//  BackgroundFetch
//
//  Created by qimuyunduan on 16/2/27.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        NSThread.sleepForTimeInterval(1)
        //开启通知
        let settings  = UIUserNotificationSettings(forTypes: [.Alert,.Badge,.Sound], categories: nil)
        application.registerUserNotificationSettings(settings)
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        //设置后台唤醒程序以获取数据的时间间隔
        application.setMinimumBackgroundFetchInterval(UIApplicationBackgroundFetchIntervalMinimum)
    }
    
    
    
    //后台获取数据
    func application(application: UIApplication, performFetchWithCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        let url = NSURL(string:"http://api.k780.com:88/?app=life.time&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json")
        let request  = NSURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithRequest(request, completionHandler: {
            (data,response,error) -> Void in
            if error != nil {
            
                print(error)
                //通知系统数据获取失败
                completionHandler(UIBackgroundFetchResult.Failed)
            }
            else {
            
                let str = NSString(data: data!, encoding:NSUTF8StringEncoding)
                print(str)
                //清除推送
                //UIApplication.sharedApplication().cancelAllLocalNotifications()
                //创建本地通知
                let newNotification = UILocalNotification()
                //设置通知发送时间
                newNotification.fireDate = NSDate(timeIntervalSinceNow: 0)
                //设置通知的时间区域
                newNotification.timeZone = NSTimeZone.defaultTimeZone()
                //设置通知内容
                newNotification.alertBody = "获取数据成功:\(str)"
                //设置通知声音
                newNotification.soundName = UILocalNotificationDefaultSoundName
                
                UIApplication.sharedApplication().scheduleLocalNotification(newNotification)
                
                //通知系统数据获取成功
                completionHandler(UIBackgroundFetchResult.NewData)
                
                
            
            }
        })
        //启动任务
        dataTask.resume()
        
    }
    
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

