//
//  SaveImageUtils.swift
//  savePhotoToAlbum
//
//  Created by qimuyunduan on 16/4/14.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
import Photos


enum SaveImageResult {
    case SUCCESS,ERROR,DENIED
}

class SaveImageUtils: NSObject {
    //是否授权
    class func isAuthorized()->Bool {
        
        return (PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.Authorized || PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.NotDetermined)
    }
    
    
    //保存图片
    class func saveImageInAlbum(image:UIImage,albumName:String = "" ,completionHandler:(result:SaveImageResult)->()) {
        
        if !isAuthorized() {
            completionHandler(result: .DENIED)
            return
            
        }
        
        var assetAlbum :PHAssetCollection?
        
        if albumName.isEmpty {
            
            let list = PHAssetCollection.fetchAssetCollectionsWithType(.SmartAlbum, subtype: .SmartAlbumUserLibrary, options: nil)
            
            assetAlbum = list[0] as? PHAssetCollection
        } else {
            
            
            let list = PHAssetCollection.fetchAssetCollectionsWithType(.Album, subtype: .Any, options: nil)
            
            
            
            list.enumerateObjectsUsingBlock({
                
                (album,index,isStop) in
                let assetCollection = album as! PHAssetCollection
                if albumName == assetCollection.localizedTitle {
                    
                    assetAlbum = assetCollection
                    isStop.memory = true
                    
                    
                }
                //若不存在则创建该相册
                if assetAlbum == nil {
                    
                    PHPhotoLibrary.sharedPhotoLibrary().performChanges({
                        PHAssetCollectionChangeRequest.creationRequestForAssetCollectionWithTitle(albumName)
                        
                        //创建后保存图片
                        }, completionHandler: {
                            
                            (isSuccess,error) in
                            
                            self.saveImageInAlbum(image, completionHandler: completionHandler)
                            
                    })
                    return
                    
                }
                
                
            })
            
        }
        
        
        PHPhotoLibrary.sharedPhotoLibrary().performChanges({
            
            let imageRequest = PHAssetChangeRequest.creationRequestForAssetFromImage(image)
            //是否添加到相册
            if !albumName.isEmpty {
                let assetPlaceholder = imageRequest.placeholderForCreatedAsset
                let albumChangeRequest = PHAssetCollectionChangeRequest(forAssetCollection: assetAlbum!)
                albumChangeRequest!.addAssets([assetPlaceholder!])
                
            }
            
            }, completionHandler: {
                (isSuccess:Bool,error:NSError?) in
                
                if isSuccess {
                    
                    completionHandler(result: .SUCCESS)
                    
                }
                else {
                    
                    print(error!.localizedDescription)
                    completionHandler(result: .ERROR)
                    
                }
                
        })
        
        
    }
}
