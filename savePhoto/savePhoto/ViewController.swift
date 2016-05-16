//
//  ViewController.swift
//  savePhoto
//
//  Created by qimuyunduan on 16/4/13.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
import Photos
class ViewController: UIViewController {
    
    
    @IBOutlet weak var beauty: UIImageView!
    
    @IBOutlet weak var figure: UIImageView!
    //资源标志符
    var photoID :String!
    //使用UIImageWriteToSavedPhotosAlbum（）保存图片到相册
    @IBAction func savePhoto(sender: UIButton) {
        
        let image = beauty.image
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        
    }
    //使用Photo library保存图片到相册
    //这种方法需要设置一个资源标志符
    @IBAction func saveFigure(sender: UIButton) {
        
        let image = figure.image
        
        PHPhotoLibrary.sharedPhotoLibrary().performChanges({
            let result = PHAssetChangeRequest.creationRequestForAssetFromImage(image!)
            let assetPlaceHolder = result.placeholderForCreatedAsset
            //保存标识符
            self.photoID = assetPlaceHolder?.localIdentifier
            }, completionHandler: {
                (isSuccess:Bool,error:NSError?) in
                if isSuccess {
                    print("保存成功.....")
                    let assetResult = PHAsset.fetchAssetsWithLocalIdentifiers([self.photoID], options: nil)
                    let asset = assetResult[0]
                    let options = PHContentEditingInputRequestOptions()
                    options.canHandleAdjustmentData = {
                        (adjustMeta:PHAdjustmentData) -> Bool in
                        return true
                        
                    }
                    //获取原图
                    PHImageManager.defaultManager().requestImageForAsset(asset as! PHAsset, targetSize:PHImageManagerMaximumSize, contentMode: .AspectFit, options: nil, resultHandler: {
                        (image,_:[NSObject:AnyObject]?) in
                        print("成功获取原图...")
                        
                    })
                    
                    //获取小图
                    PHImageManager.defaultManager().requestImageForAsset(asset as! PHAsset, targetSize:CGSizeMake(100, 100), contentMode: .AspectFit, options: nil, resultHandler: {
                        (image,_:[NSObject:AnyObject]?) in
                        print("成功获取小图...")
                        
                    })
                    
                    
                    
                }
                else {
                    
                    print("保存失败..")
                    
                }
            }
        )
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

