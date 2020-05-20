//
//  Clock.swift
//  hiit-workout
//
//  Created by Mitchel Wassler on 5/19/20.
//  Copyright © 2020 Mitchel Wassler. All rights reserved.
//

import Foundation

class CountDown {
    var timer: Timer?
    
    var countedMins = 5
    var countedSeconds = 0
    var seconds = 59
    
    init(minutes: Int, seconds: Int) {
        countedMins = minutes
        countedSeconds = seconds
    }
    
    func displayTime() -> String {
        var minsString = "\(countedMins)"
        if countedMins < 10 || countedMins == 0 {
            minsString = "0\(countedMins)"
        }
        
        var secondString = "\(countedSeconds)"
        if countedSeconds < 10 || countedSeconds == 0 {
            secondString = "0\(countedSeconds)"
        }

        return "\(minsString):\(secondString)"
    }
    
    // , onComplete: () -> Void
    func start(onUpdate: @escaping (_ time: String) -> Void) {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if self.countedSeconds > 0 {
                    self.countedSeconds -= 1
                } else {
                    if self.countedMins > 0 {
                        self.countedMins -= 1
                        self.countedSeconds = self.seconds
                    }
                }
                let displayTime = self.displayTime()
                onUpdate(displayTime)
                print(displayTime)
            }
        }
    }
}
