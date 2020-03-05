//
//  DetailRankerViewController.swift
//  LightningGame
//
//  Created by Daisuke Orita on 2020/03/05.
//  Copyright © 2020 Daisuke Orita. All rights reserved.
//

import UIKit

class DetailRankerViewController: UIViewController {
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var basicPointLabel: UILabel!
    @IBOutlet weak var missPenaltyLabel: UILabel!
    @IBOutlet weak var timeBonusLabel: UILabel!
    @IBOutlet weak var numberOfResponsesLabel: UILabel!
    @IBOutlet weak var accuracyRateLabel: UILabel!
    
    
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
        
        playerNameLabel.text = "\(playerName) 'score"
        scoreLabel.text = String(score)
        basicPointLabel.text = "Basic point: \(basicPoint)"
        missPenaltyLabel.text = "Miss penalty: \(missPenalty)"
        timeBonusLabel.text = "Time bonus: \(timeBonus)"
        numberOfResponsesLabel.text = "Number of responses: \(numberOfResponses)"
        accuracyRateLabel.text = "Accuracy rate: \(accuracyRate)%"
    }
    
    
}
