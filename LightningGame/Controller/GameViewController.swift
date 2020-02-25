//
//  GameViewController.swift
//  LightningGame
//
//  Created by Daisuke Orita on 2020/02/22.
//  Copyright © 2020 Daisuke Orita. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, CountDownDelegate {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    var leftNumber = Int()
    var rightNumber = Int()
    var score = Int()
    var t = Double()
    
    // カウントダウンに必要な要素
    var countDown = CountDown()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countDown.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        countDown.startTimer() // 10秒のカウントダウン開始
        
    }
    
    func updateTimerLabel(_ t: Double) {
        self.t = t
        timerLabel.text = String(format: "%.2f", t)
    }
    
    
    
}
