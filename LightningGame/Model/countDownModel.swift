//
//  countDownModel.swift
//  LightningGame
//
//  Created by Daisuke Orita on 2020/02/22.
//  Copyright © 2020 Daisuke Orita. All rights reserved.
//

import Foundation

class CountDown {
    
    var t: Double = 10.00
    var timer = Timer()
    var startTime: TimeInterval? = nil
    
    var timerCountString: String = "10.00"
    
    
    
    func startTimer() {
        startTime = Date.timeIntervalSinceReferenceDate
        timer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(update),
            userInfo: nil,
            repeats: true)
    }
    
    @objc func update() {
        if let startTime = startTime {
            t = 10.00 - (Date.timeIntervalSinceReferenceDate - startTime)
            
        }
        if t <= 0 {
            t = 0
            timer.invalidate()
        }
        timerCountString = String(format: "%.2f", t)
        let gameVC = GameViewController()
        gameVC.timerCountString = timerCountString
        gameVC.updateTimerLabel()
    }
    
    
}
