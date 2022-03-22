//
//  AlarmViewController.swift
//  EyeAlarm
//
//  Created by 김종엽 on 2022/03/13.
//

import Foundation
import UIKit
import AVFoundation

var audio : AVPlayer!

class AlarmViewController : UIViewController{
    
    @IBAction func wakedButtontapped(_ sender: UIButton) {
        stopAlarm()
        self.dismiss(animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        playAlarm()
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: completion)
        
    }
    
}

func stopAlarm() {
    // To pause or stop audio in swift 5 audio.stop() isn't working
    audio.pause()
}

func playAlarm() {
//    var audiovisualBackgroundPlaybackPolicy: AVPlayerAudiovisualBackgroundPlaybackPolicy!
    // need to declare local path as url]
    let url = Bundle.main.url(forResource: "alarmSample", withExtension: "mp3")
    // now use declared path 'url' to initialize the player
    audio = AVPlayer.init(url: url!)
    // after initialization play audio its just like click on play button
 //   audiovisualBackgroundPlaybackPolicy =
 //   audio.audiovisualBackgroundPlaybackPolicy = .continuesIfPossible
//    audio.isExternalPlaybackActive = true
    
    audio.audiovisualBackgroundPlaybackPolicy = .continuesIfPossible
//    audio.usesExternalPlaybackWhileExternalScreenIsActive = true
 //   audio.
    
    audio.play()
}

