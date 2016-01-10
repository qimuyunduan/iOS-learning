//
//  ViewController.swift
//  albumpicker
//
//  Created by qimuyunduan on 16/1/10.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate {
    
    
    @IBOutlet var changeImageButton: UIButton!
    
    
    let picker = UIImagePickerController()
    /**
     在image上添加一层用于修改图片
     
     - returns: ...
     */
    func initButtonAndImage() {
        
        
        changeImageButton.layer.cornerRadius = self.changeImageButton.frame.width/2.0
        changeImageButton.alpha = 0.5
        changeImageButton.addTarget(self, action: "showMyself:", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    
    func showMyself(sender:UIButton) {
        
        let choosePictureSource = UIActionSheet()
        choosePictureSource.cancelButtonIndex = 0
        choosePictureSource.addButtonWithTitle("取消")
        choosePictureSource.addButtonWithTitle("拍照")
        choosePictureSource.addButtonWithTitle("从相册中选取")
        choosePictureSource.delegate = self
        choosePictureSource.showInView(self.view)
        
        
    }
   
    
    //MARK: 从相册选择照片
    func choosePictureFromAlbum() {
        
        if UIImagePickerController.isSourceTypeAvailable(.SavedPhotosAlbum)
        {
            
            
            picker.delegate = self
            //设置图片类型
            picker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
            self.presentViewController(picker, animated: true, completion: nil)
        }else{
            
            let alert = UIAlertView(title: "读取相册错误", message: nil, delegate: nil,cancelButtonTitle: "确定")
            alert.show()
            
            
        }
        
    }
    
    /**
     从相机中选择图片要在真机上测试
     */
    func choosePictureFromCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.Camera)
        {
            
            
            picker.delegate = self
            //设置图片类型
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(picker, animated: true, completion: nil)
        }else{
            
            let alert = UIAlertView(title: "读取相册错误", message: nil, delegate: nil,cancelButtonTitle: "确定")
            alert.show()
            
            
        }
    
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1 {
            choosePictureFromCamera()
        }
        else if buttonIndex == 2 {
            choosePictureFromAlbum()
        }
    }
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        print(info)
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        changeImageButton.setImage(image, forState: UIControlState.Normal)
       
        self.picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initButtonAndImage()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

