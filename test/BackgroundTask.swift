//
//  BackgroundTask.swift
//  test
//
//  Created by Yaro on 8/27/16.
//  Copyright © 2016 Yaro. All rights reserved.
//

import AVFoundation

class BackgroundTask {
    
    var player = AVAudioPlayer()
   
    func startBackgroundTask() {
        self.playAudio()
    }
    
    func stopBackgroundTask() {
        player.stop()
    }
    
    
    func playAudio() {
        dispatch_async(dispatch_get_main_queue(), {() -> Void in
            do {
                if let bundle = NSBundle.mainBundle().pathForResource("3", ofType: "wav") {
                    let alertSound = NSURL(fileURLWithPath: bundle)
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, withOptions:AVAudioSessionCategoryOptions.MixWithOthers)
                    try AVAudioSession.sharedInstance().setActive(true)
                    try self.player = AVAudioPlayer(contentsOfURL: alertSound)
                    self.player.numberOfLoops = -1
                    self.player.volume = 0.01
                    self.player.prepareToPlay()
                    self.player.play()
                    
                }
            } catch {
                print(error)
            }
        })
    }
}