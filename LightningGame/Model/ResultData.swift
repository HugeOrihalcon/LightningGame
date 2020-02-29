//
//  ResultData.swift
//  LightningGame
//
//  Created by Daisuke Orita on 2020/02/29.
//  Copyright © 2020 Daisuke Orita. All rights reserved.
//

import Foundation
import Firebase

class ResultData {
    
    let ref: DatabaseReference!
    
    var playerName = String()
    var score = Int()
    var basicPoint = Int()
    var missPenalty = Int()
    var timeBonus = Int()
    var numberOfResponses = Int()
    var accuracyRate = Int()
    
    init(playerName: String, score: Int, basicPoint: Int, missPenalty: Int, timeBonus:Int, numberOfResponses:Int, accuracyRate: Int) {
        self.playerName = playerName
        self.score = score
        self.basicPoint = basicPoint
        self.missPenalty = missPenalty
        self.timeBonus = timeBonus
        self.numberOfResponses = numberOfResponses
        self.accuracyRate = accuracyRate
        
        ref = Database.database().reference().child("players").childByAutoId()
    }
    
    
    
}
