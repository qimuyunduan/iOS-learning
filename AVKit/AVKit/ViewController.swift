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
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let videoURL = ""
        
        let AVPlayer = AVPlayer(URL:videoURL)
        let playerController = AVPlayerLayerController(player: AVPlayer)
        playerController.
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

