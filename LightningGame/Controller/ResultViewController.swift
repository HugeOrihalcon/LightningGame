//
//  ResultViewController.swift
//  LightningGame
//
//  Created by Daisuke Orita on 2020/02/26.
//  Copyright © 2020 Daisuke Orita. All rights reserved.
//

import UIKit
import PKHUD
import Firebase

class ResultViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var basicPointLabel: UILabel!
    @IBOutlet weak var missPenaltyLabel: UILabel!
    @IBOutlet weak var timeBonusLabel: UILabel!
    @IBOutlet weak var numberOfResponsesLabel: UILabel!
    @IBOutlet weak var accuracyRateLabel: UILabel!
    
    var numberOfCorrect = Int()
    var playerName = String()
    
    var score = Int()
    var basicPoint = Int()
    var missPenalty = Int()
    var timeBonus = Int()
    var numberOfResponses = Int()
    var accuracyRate = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        basicPoint = numberOfCorrect * 100
        missPenalty = (numberOfResponses - numberOfCorrect) * (-100)
        if numberOfResponses != 0 {
            accuracyRate = Int((Double(numberOfCorrect) / Double(numberOfResponses)) * 100)
        }
        
        scoreLabel.text = String(score)
        basicPointLabel.text = "Basic point: \(basicPoint)"
        missPenaltyLabel.text = "Miss penalty: \(missPenalty)"
        timeBonusLabel.text = "Time bonus: \(timeBonus)"
        numberOfResponsesLabel.text = "Number of responses: \(numberOfResponses)"
        accuracyRateLabel.text = "Accuracy rate: \(accuracyRate)%"
        
        //ランクインした場合の処理
        HUD.show(.progress)
        Database.database().reference().child("players").queryOrdered(byChild: "score").queryLimited(toFirst: 1).observe(.value) { (snapshot) in
            for child in snapshot.children {
                let childSnapshot = child as! DataSnapshot
                let playerData = ResultData(snapshot: childSnapshot)
                HUD.hide()
                if self.score > playerData.score {
                    self.rankin()
                }
            }
        }
    }
    
    @IBAction func retryButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func quitButton(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    
    func rankin() {
        var alertTextField = UITextField()
        let alert = UIAlertController(title: "ランクインしました‼︎", message: "あなたの名前を入力してください", preferredStyle: .alert)
        
        //OKボタンを生成
        let okAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
            guard let text = alertTextField.text else { return }
            self.playerName = text
            //firebaseに情報を保存
            let resultData = ResultData(playerName: self.playerName, score: self.score, basicPoint: self.basicPoint, missPenalty: self.missPenalty, timeBonus: self.timeBonus, numberOfResponses: self.numberOfResponses, accuracyRate: self.accuracyRate)
            resultData.save()
        }
        alert.addAction(okAction) //OKボタンを追加
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction) //Cancelボタン追加
        
        alert.addTextField { (text:UITextField!) in
            alertTextField = text //TextFieldを追加
            text.placeholder = "好きな名前を入力してね"
        }
        present(alert, animated: true, completion: nil) //アラートを表示
    }
    
    
}
