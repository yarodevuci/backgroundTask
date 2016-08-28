//
//  BackgroundTask.swift
//
//  Created by Yaro on 8/27/16.
//  Copyright © 2016 Yaro. All rights reserved.
//

import AVFoundation

class BackgroundTask {
    
    var player = AVAudioPlayer()
    var timer = NSTimer()
    
    func startBackgroundTask() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(interuptedAudio), name: AVAudioSessionInterruptionNotification, object: AVAudioSession.sharedInstance())
        self.playAudio()
    }
    
    func stopBackgroundTask() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: AVAudioSessionInterruptionNotification, object: nil)
        player.stop()
    }
    
    @objc private func interuptedAudio(notification: NSNotification) {
        if notification.name == AVAudioSessionInterruptionNotification && notification.userInfo != nil {
            var info = notification.userInfo!
            var intValue = 0
            info[AVAudioSessionInterruptionTypeKey]!.getValue(&intValue)
            if intValue == 1 { playAudio() }
        }
    }
    
    private func playAudio() {
        do {
            let bundle = NSBundle.mainBundle().pathForResource("11", ofType: "wav")
            let alertSound = NSURL(fileURLWithPath: bundle!)
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, withOptions:AVAudioSessionCategoryOptions.MixWithOthers)
            try AVAudioSession.sharedInstance().setActive(true)
            try self.player = AVAudioPlayer(contentsOfURL: alertSound)
            self.player.numberOfLoops = -1
            self.player.volume = 0.01
            self.player.prepareToPlay()
            self.player.play()
        } catch { print(error) }
    }
}