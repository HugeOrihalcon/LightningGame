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
    var correctNumber = Int()
    
    // カウントダウンに必要な要素
    var countDown = CountDown()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countDown.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        countDown.startTimer() // 10秒のカウントダウン開始
        changeNumber()
        
    }
    
    func updateTimerLabel(_ t: Double) { //countDownModelのtを引っ張ってくる
        self.t = t
        timerLabel.text = String(format: "%.2f", t)
    }
    
    func changeNumber() { //左右のボタンの数字をランダムに変更するための関数
        leftNumber = Int(arc4random_uniform(9)) + 1
        rightNumber = Int(arc4random_uniform(9)) + 1
        leftButton.setTitle(String(leftNumber), for: .normal)
        rightButton.setTitle(String(rightNumber), for: .normal)
    }
    
    func scorePlus(_ point: Int) {
        score += point
        scoreLabel.text = String(score)
    }
    
    func scoreMinus(_ point: Int) {
        score -= point
        scoreLabel.text = String(score)
    }
    
    func judgeAnswer() { //左右の数値から答え（correctNumber）を生成する関数
        if leftNumber + rightNumber == 10 {
            correctNumber = 1
        } else if leftNumber == rightNumber {
            correctNumber = 4
        } else if leftNumber > rightNumber {
            correctNumber = 2
        } else if leftNumber < rightNumber {
            correctNumber = 3
        }
    }
    
    
    @IBAction func tenPush(_ sender: Any) {
        judgeAnswer()
        if correctNumber == 1 {
            scorePlus(100)
        } else {
            scoreMinus(50)
        }
        changeNumber()
    }
    
    @IBAction func leftPush(_ sender: Any) {
        judgeAnswer()
        if correctNumber == 2 {
            scorePlus(100)
        } else {
            scoreMinus(50)
        }
        changeNumber()
    }
    
    @IBAction func rightPush(_ sender: Any) {
        judgeAnswer()
        if correctNumber == 3 {
            scorePlus(100)
        } else {
            scoreMinus(50)
        }
        changeNumber()
    }
    
    @IBAction func equalPush(_ sender: Any) {
        judgeAnswer()
        if correctNumber == 4 {
            scorePlus(100)
        } else {
            scoreMinus(50)
        }
        changeNumber()
    }
    
    
    
    
    
}
