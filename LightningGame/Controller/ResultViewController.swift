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
    
    var score = Int()
    var numberOfResponses = Int()
    var numberOfCorrect = Int()
    var timeBonusPoint = Int()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        scoreLabel.text = String(score)
        basicPointLabel.text = "Basic point: \(numberOfCorrect * 100)"
        missPenaltyLabel.text = "Miss penalty: \((numberOfResponses - numberOfCorrect) * (-100))"
        timeBonusLabel.text = "Time bonus: \(timeBonusPoint)"
        numberOfResponsesLabel.text = "Number of responses: \(numberOfResponses)"
        accuracyRateLabel.text = "Accuracy rate: \(Int((Double(numberOfCorrect) / Double(numberOfResponses)) * 100))%"
    }
    
    @IBAction func retryButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func quitButton(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    
}
