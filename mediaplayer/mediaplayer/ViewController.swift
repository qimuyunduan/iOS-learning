//
//  ViewController.swift
//  mediaplayer
//
//  Created by qimuyunduan on 16/1/13.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    
    let videoPath:String? = NSBundle.mainBundle().pathForResource("4", ofType: "mp4")
    let  moviePlayer = MPMoviePlayerController()
    /**
     play local music
     
     - parameter sender: touch button to play
     */
    @IBAction func playLocalVideo(sender: UIButton) {
        moviePlayer.contentURL = NSURL(fileURLWithPath: videoPath!)
        moviePlayer.play()
    }
    /**
     play online video
     
     - parameter sender: touch button to play
     */
    @IBAction func playOnlineVideo(sender: UIButton) {
       moviePlayer.contentURL = NSURL(string: "http://player.youku.com/player.php/sid/XMTQ0NTIzNTE0NA==/v.swf")
        moviePlayer.play()
        
    }
    /**
     notify when playing over
     */
    func moviePlayerPreloadFinish() {
    
    print("播放完毕...")
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviePlayer.controlStyle = MPMovieControlStyle.Fullscreen
        let videoView = self.view.viewWithTag(4)
        moviePlayer.view.frame = (videoView?.frame)!
        videoView?.addSubview(moviePlayer.view)
        // get notification when player playing completed
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "moviePlayerPreloadFinish:", name: MPMoviePlayerPlaybackDidFinishNotification, object: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

