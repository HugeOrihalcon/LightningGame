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
    var answerTime = Double()
    var questionChangeTime = Double()
    
    //Resultに渡すための変数
    var numberOfResponses = Int()
    var numberOfCorrect = Int()
    var timeBonusPoint = Int()
    
    // カウントダウンに必要な要素
    var countDown = CountDown()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countDown.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //色々な変数をリセット
        t = 10.00
        numberOfResponses = 0
        numberOfCorrect = 0
        timeBonusPoint = 0
        countDown.startTimer() // 10秒のカウントダウン開始
        changeNumber()
        
    }
    
    func updateTimerLabel(_ t: Double) { //countDownModelのtを引っ張ってくる
        self.t = t
        timerLabel.text = String(format: "%.2f", t)
    }
    
    func timeOver() { //残り時間がゼロになった時の処理
        t = 10.00 //残り時間をリセット
        performSegue(withIdentifier: "toResult", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.score = score
            resultVC.numberOfResponses = numberOfResponses
            resultVC.numberOfCorrect = numberOfCorrect
            resultVC.timeBonusPoint = timeBonusPoint
        }
    }
    
    func changeNumber() { //左右のボタンの数字をランダムに変更するための関数
        leftNumber = Int(arc4random_uniform(9)) + 1
        rightNumber = Int(arc4random_uniform(9)) + 1
        leftButton.setTitle(String(leftNumber), for: .normal)
        rightButton.setTitle(String(rightNumber), for: .normal)
        questionChangeTime = t //出題時点での残り時間を記録
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
        numberOfResponses += 1 //回答数を加算
        answerTime = t //回答時点の残り時間を記録
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
    
    func timeBonus() { //1秒以内に回答した場合にタイムボーナスを加算する
        var bonusPoint = Int()
        if questionChangeTime - answerTime < 1 {
            bonusPoint = Int((1-(questionChangeTime - answerTime)) * 100)
            scorePlus(bonusPoint)
            timeBonusPoint += bonusPoint
        }
    }
    
    @IBAction func tenPush(_ sender: Any) {
        judgeAnswer()
        if correctNumber == 1 {
            numberOfCorrect += 1 //正当数を加算
            scorePlus(100)
            timeBonus()
        } else {
            scoreMinus(50)
        }
        changeNumber()
    }
    
    @IBAction func leftPush(_ sender: Any) {
        judgeAnswer()
        if correctNumber == 2 {
            numberOfCorrect += 1 //正当数を加算
            scorePlus(100)
            timeBonus()
        } else {
            scoreMinus(50)
        }
        changeNumber()
    }
    
    @IBAction func rightPush(_ sender: Any) {
        judgeAnswer()
        if correctNumber == 3 {
            numberOfCorrect += 1 //正当数を加算
            scorePlus(100)
            timeBonus()
        } else {
            scoreMinus(50)
        }
        changeNumber()
    }
    
    @IBAction func equalPush(_ sender: Any) {
        judgeAnswer()
        if correctNumber == 4 {
            numberOfCorrect += 1 //正当数を加算
            scorePlus(100)
            timeBonus()
        } else {
            scoreMinus(50)
        }
        changeNumber()
    }
    
    
    
    
    
}
