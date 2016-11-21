# backgroundTask iOS Swift version

<span class="badge-paypal"><a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=JAGFP3M6BG7LN" title="Donate to this project using PayPal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal Donation Button" /></a></span>

This is an updated Swift version of the example of the Infinite Running Background Task written in Objective C
http://hayageek.com/ios-long-running-background-task/ 
Infinite task is based on playing blank audio file.
My version is simplified to a minumum to run the task forever in the background.
I also included a blank wav file that will be played forever until you stop the task.
*Note: Battery consuming is 10% for 24 hours period. 

#YouTube tutorial and overview 
https://www.youtube.com/watch?v=j7b35lFcMqM

## Installation
Copy manually file `BackgroundTask.swift` into your project.

#Warning
Do NOT attemp to use my implementation if you are planning to push your app to the App Store. 
Apple will 100% reject such behavior. This project was designed for research purposes or personal use.

# Usage
```Swift
var backgroundTask = BackgroundTask()
//Start playing blank audio file. 
//You can run NSTimer() or whatever you need and it will continue executing in the background.
backgroundTask.startBackgroundTask() 
//Stop the task when you don't need it 
backgroundTask.stopBackgroundTask()
```


