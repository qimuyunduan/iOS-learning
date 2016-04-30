//
//  ViewController.swift
//  AVKit
//
//  Created by qimuyunduan on 16/4/27.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //本地视频
//        let filePath = NSBundle.mainBundle().pathForResource("348714514", ofType:"mp4")
//       
//        let videoURL = NSURL(fileURLWithPath: filePath!)
        //网络视频
        let videoURL = NSURL(string: "http://hangge.com/demo.mp4")
        
        //定义一个视频播放器，通过本地文件路径初始化
        let player = AVPlayer(URL: videoURL!)
        //设置大小和位置（全屏）
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        //添加到界面上
        self.view.layer.addSublayer(playerLayer)
        //开始播放
        player.play()
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
