//
//  ViewController.swift
//  test
//
//  Created by Yaro on 8/26/16.
//  Copyright © 2016 Yaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var starTaskButton: UIButton!
    @IBOutlet weak var stopTaskButton: UIButton!
    
    var timer = NSTimer()
    var backgroundTask = BackgroundTask()
    
    @IBAction func startBackgroundTask(sender: AnyObject) {
        backgroundTask.startBackgroundTask()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
        starTaskButton.alpha = 0.5
        starTaskButton.userInteractionEnabled = false
        
        stopTaskButton.alpha = 1
        stopTaskButton.userInteractionEnabled = true
    }
    
    @IBAction func stopBackgroundTask(sender: AnyObject) {
        starTaskButton.alpha = 1
        starTaskButton.userInteractionEnabled = true
        stopTaskButton.alpha = 0.5
        stopTaskButton.userInteractionEnabled = false
        
        timer.invalidate()
        backgroundTask.stopBackgroundTask()
        label.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopTaskButton.alpha = 0.5
        stopTaskButton.userInteractionEnabled = false
        
    }
    
    func timerAction() {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([ .Hour, .Minute, .Second], fromDate: date)
        let hour = components.hour
        let minutes = components.minute
        let seconds = components.second
        label.text = "\(hour):\(minutes) \(seconds)"
        print("SomeCoolTaskRunning.....")
    }
}


