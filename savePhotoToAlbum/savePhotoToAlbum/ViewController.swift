//
//  ViewController.swift
//  savePhotoToAlbum
//
//  Created by qimuyunduan on 16/4/14.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    /**
     保存到相机卷
     
     - parameter sender: <#sender description#>
     */
    @IBAction func saveImage(sender: AnyObject) {
        
        SaveImageUtils.saveImageInAlbum(imageView.image!){
            (result) in
            switch result{
                
            case .SUCCESS:
                print("保存成功")
            case .DENIED:
                print("被拒绝")
            case .ERROR:
                print("错误")
                
            }
            
        }
    }
        /**
         保存到相簿
         
         - parameter sender: <#sender description#>
         */
        @IBAction func saveToAlbum(sender: AnyObject) {
            
            SaveImageUtils.saveImageInAlbum(imageView.image!, albumName: "blogme"){
                
                (result) in
                
                switch result{
                    
                case .SUCCESS:
                    print("保存成功")
                case .DENIED:
                    print("被拒绝")
                case .ERROR:
                    print("错误")
                    
                }
                
                
            }
            
            
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

