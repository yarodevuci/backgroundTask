# backgroundTask

This is an updated Swift version of the example of the Infinite Running Background Task
http://hayageek.com/ios-long-running-background-task/ that was written in objective C
Infinite task is based on playing blank audio file
My version is simplified to a minumum to run the task forever in the background
I also included a blank wav file that will be played forever until you stop the task

## Installation
Copy manually file `BackgroundTask.swift` into your project.

# Usage
```Swift
var backgroundTask = BackgroundTask()
backgroundTask.startBackgroundTask() //Starts playing blank audio file. You can run NSTimer() or whatever you need and it will continue executing in the background.

backgroundTask.stopBackgroundTask() //Stops the task
```


