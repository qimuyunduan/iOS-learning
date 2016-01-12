//
//  ViewController.swift
//  andioService
//
//  Created by qimuyunduan on 16/1/10.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate {
    
    var musicPlayer:AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet var musicPlayProgress: UIView!
    
    @IBOutlet var playLabel: UILabel!
    
    @IBOutlet var jindu: UISlider!
    
    @IBOutlet var pauseButton: UIButton!
    /**
     play short audio
     
     - parameter sender: launch action when touchUpInSide
     */
    @IBAction func playSestemsound(sender: UIButton) {
        var soundID:SystemSoundID = 0
        let path = NSBundle.mainBundle().pathForResource("audio", ofType: "m4a")
        let audioURL = NSURL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(audioURL, &soundID)
        AudioServicesPlayAlertSound(soundID)
        
    }
    
    func preparePlayer() {
//        musicPlayer.delegate = self
        let musicPath = NSBundle.mainBundle().pathForResource("Next to You", ofType: ".mp3")
        print(musicPath)
        let musicURL = NSURL.fileURLWithPath(musicPath!)
        musicPlayer = try! AVAudioPlayer(contentsOfURL: musicURL)
        musicPlayer.prepareToPlay()
        
    }
    
    
    
    @IBAction func playMusic(sender: AnyObject) {
        
        if musicPlayer.playing {
            
            return
            
        }
        musicPlayer.play()
        jindu.minimumValue = 0.0
        jindu.maximumValue = Float(musicPlayer.duration)
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "updateTime", userInfo: nil, repeats: true)
    }
    @IBAction func playPause(sender: AnyObject) {
        
        if musicPlayer.playing && pauseButton.titleForState(UIControlState.Normal) == "暂停" {
            musicPlayer.pause()
            pauseButton.setTitle("继续", forState: UIControlState.Normal)
        }
        else if pauseButton.titleForState(UIControlState.Normal) == "继续" {
            
            musicPlayer.play()
            pauseButton.setTitle("暂停", forState: UIControlState.Normal)
            
        }
        
        
        
    }
    @IBAction func playStop(sender: UIButton) {
        
        if musicPlayer.playing
        {
            musicPlayer.stop()
            jindu.value = 0.0
            musicPlayer.currentTime = 0
            playLabel.text = ""
            
        }
    }
    
    @IBAction func changePlayProgress(sender: UISlider) {
        
        musicPlayer.currentTime = NSTimeInterval(sender.value)
        musicPlayer.play()
        
        
    }
    @IBAction func volumeChanged(sender: UISlider) {
        
        musicPlayer.volume = sender.value
        
        
    }
    func updateTime() {
        let currentTime = Float(musicPlayer.currentTime)
        jindu.value = currentTime
        let totalTime = Float(musicPlayer.duration)
        let hours = Int(totalTime/3600)
        let minutes = Int(totalTime/60)
        let seconds = Int(totalTime%60)
        let curhours = Int(currentTime/3600)
        let curminutes = Int(currentTime/60)
        let curseconds = Int(currentTime%60)
        playLabel.text = String(NSString(format: "%.2d:%.2d:%.2d / %.2d:%.2d:%.2d",curhours,curminutes,curseconds,hours,minutes,seconds))
        
    }
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer, error: NSError?)
    {
        print("音频解码错误...")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        preparePlayer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

