//
//  ResultViewController.swift
//  LightningGame
//
//  Created by Daisuke Orita on 2020/02/26.
//  Copyright © 2020 Daisuke Orita. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var basicPointLabel: UILabel!
    @IBOutlet weak var missPenaltyLabel: UILabel!
    @IBOutlet weak var timeBonusLabel: UILabel!
    @IBOutlet weak var numberOfResponsesLabel: UILabel!
    @IBOutlet weak var accuracyRateLabel: UILabel!
    
    let rankinAlert = RankinAlert()
    
    
    var numberOfCorrect = Int()
    
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
        accuracyRate = Int((Double(numberOfCorrect) / Double(numberOfResponses)) * 100)
        
        scoreLabel.text = String(score)
        basicPointLabel.text = "Basic point: \(basicPoint)"
        missPenaltyLabel.text = "Miss penalty: \(missPenalty)"
        timeBonusLabel.text = "Time bonus: \(timeBonus)"
        numberOfResponsesLabel.text = "Number of responses: \(numberOfResponses)"
        accuracyRateLabel.text = "Accuracy rate: \(accuracyRate)%"
        
        //ランクインした場合の処理
        if score >= 600 {
            rankinAlert.rankin(viewController: self)
        }
    }
    
    @IBAction func retryButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func quitButton(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    
}
