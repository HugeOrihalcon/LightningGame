//
//  GameViewController.swift
//  LightningGame
//
//  Created by Daisuke Orita on 2020/02/22.
//  Copyright © 2020 Daisuke Orita. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, CountDownDelegate {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    var countDown = CountDown()
    var timerCountString: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countDown.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 10秒のカウントダウン開始
        countDown.startTimer()
        
    }
    
    func updateTimerLabel(_ timerCountString: String) {
        timerLabel.text = timerCountString
    }
}
