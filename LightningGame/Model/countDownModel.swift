//
//  countDownModel.swift
//  LightningGame
//
//  Created by Daisuke Orita on 2020/02/22.
//  Copyright © 2020 Daisuke Orita. All rights reserved.
//

import Foundation

protocol CountDownDelegate : class {
    func updateTimerLabel(_: Double)
}

class CountDown {
    
    var t = Double()
    var timer = Timer()
    var startTime: TimeInterval? = nil
    
    weak var delegate: CountDownDelegate?
    
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
        t = Double(Int(t * 100)) / 100  // tを小数点第二位に変換
        delegate?.updateTimerLabel(t)
    }
    
    
}
