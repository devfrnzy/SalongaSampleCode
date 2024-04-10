//
//  TickTimer.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import Foundation

/// Timer-based object where you can set the value of Tick Interval.
/// Subscribe to Time Remaining in order to timeRemaining to do something for every tick of the timer.
class TickTimer: ObservableObject {
    
    @Published var timeRemaining: TimeInterval
    @Published var timerFinished = false
    
    let totalTime: TimeInterval
    var tickInterval: Double = 0.10
    var timer: Timer?
    
    init(totalTime: TimeInterval,
         tickInterval: Double = 0.10) {
        self.totalTime = totalTime
        self.timeRemaining = totalTime
        self.tickInterval = tickInterval
    }
    
    func startTimer() {
        stopTimer()
        timeRemaining = totalTime
        timerFinished = false
        timer = Timer.scheduledTimer(timeInterval: tickInterval, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
    }
    
    func resumeTimer() {
        timer = Timer.scheduledTimer(timeInterval: tickInterval, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func endTimer() {
        timeRemaining = 0
        stopTimer()
        timerFinished = true
    }
    
    @objc func timerTick() {
        timeRemaining -= tickInterval
        if timeRemaining <= 0 {
            endTimer()
        }
    }
    
}
