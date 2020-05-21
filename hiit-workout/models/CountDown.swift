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
    var startingCountedMins = 5
    var startingCountedSeconds = 0
    var seconds = 59
    
    init(minutes: Int, seconds: Int) {
        countedMins = minutes
        countedSeconds = seconds
        startingCountedMins = minutes
        startingCountedSeconds =  seconds
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
    
    func update() -> Void {
        if countedSeconds > 0 {
            countedSeconds -= 1
        } else {
            if countedMins > 0 {
                countedMins -= 1
                countedSeconds = seconds
            }
        }
    }
    
    func stopTimer() -> Void {
        timer?.invalidate()
        timer = Timer()
    }
    
    func reset() -> Void {
        countedMins = startingCountedMins
        countedSeconds = startingCountedSeconds
    }
    
    func start(onUpdate: @escaping (_ time: String) -> Void) {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.update()
                let displayTime = self.displayTime()
                onUpdate(displayTime)
                if displayTime == "00:00" {
                    self.stopTimer()
                    self.reset()
                }
            }
        }
    }
    
    func start(onUpdate: @escaping (_ time: String) -> Void, onComplete: @escaping () -> Void) {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.update()
                let displayTime = self.displayTime()
                onUpdate(displayTime)
                if displayTime == "00:00" {
                    self.stopTimer()
                    self.reset()
                    onComplete()
                }
            }
        }
    }
}
