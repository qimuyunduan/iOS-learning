//
//  ViewController.swift
//  TestCoreData
//
//  Created by qimuyunduan on 15/12/3.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet var text: UITextView!
    let app = UIApplication.sharedApplication().delegate as! AppDelegate
    
    
    
    
    @IBAction func insert(sender: UIButton) {
        
        let context = app.managedObjectContext

        let oneUser = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: context) as! User
        oneUser.userID = String(arc4random())
        oneUser.userName = "jack"
        oneUser.userEmail = "84525242@qq.com"
        oneUser.userPassword = "101"
        do{
            
        try context.save()
            }
        catch{
        
        print("save failure")
        
        }
        //Swift - 使用arc4random()、arc4random_uniform()取得随机数
    }
    @IBAction func search(sender: UIButton) {
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest()
        fetchRequest.fetchLimit = 10
        fetchRequest.fetchOffset = 0
        
        let entity = NSEntityDescription.entityForName("User", inManagedObjectContext: context)
        
        fetchRequest.entity = entity
        let predict = NSPredicate(format: "userPassword='10141010122'", "")
        fetchRequest.predicate = predict
        let fetchedObject:[AnyObject]?
        //查询
        do{
            
            fetchedObject =  try context.executeFetchRequest(fetchRequest)
            for info:User in fetchedObject as! [User] {
                
                text.text = "ID:"+info.userID!+"\nname:"+info.userName!+"\nEmail:"+info.userEmail!+"\npassword:"+info.userPassword!
                
            }
        }
        catch{
        
        print("查询失败！")
        
        
        }
        
        
        
        
        
        
        
        
        
        
    }
    @IBAction func change(sender: UIButton) {
        
        
        print("重新赋值后，调用context.save()即可")
        
        
        
        
    }
   
    
    @IBAction func del(sender: UIButton) {
        
        print("调用context.delete() 在调用context.save()")
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

