//
//  GameViewController.swift
//  LightningGame
//
//  Created by Daisuke Orita on 2020/02/22.
//  Copyright © 2020 Daisuke Orita. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
//    var countDown = CountDown()
    
    var timerCountString: String = ""
    
    var t: Double = 10.00
    var timer = Timer()
    var startTime: TimeInterval? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        timerLabel.text = "test"
        // 10秒のカウントダウン開始
//        countDown.startTimer()
        startTimer()
        
    }
    
//    func updateTimerLabel() {
//        print(timerCountString)
//        timerLabel.text = "test2"
//    }
    
    
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
           timerLabel.text = timerCountString
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
