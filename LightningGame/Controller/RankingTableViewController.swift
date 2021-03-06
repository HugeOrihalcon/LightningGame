//
//  RankingTableViewController.swift
//  LightningGame
//
//  Created by Daisuke Orita on 2020/03/03.
//  Copyright © 2020 Daisuke Orita. All rights reserved.
//

import UIKit
import Firebase
import PKHUD

class RankingTableViewController: UITableViewController {
    
    var resultDataArray = [ResultData]()
    
    var playerName = String()
    var score = Int()
    var basicPoint = Int()
    var missPenalty = Int()
    var timeBonus = Int()
    var numberOfResponses = Int()
    var accuracyRate = Int()
    
    @IBOutlet var resultTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        HUD.show(.progress)
        
        Database.database().reference().child("players").queryOrdered(byChild: "score").observe(.value) { (snapshot) in
            self.resultDataArray.removeAll()
            for child in snapshot.children {
                let childSnapshot = child as! DataSnapshot
                let playerData = ResultData(snapshot: childSnapshot)
                self.resultDataArray.insert(playerData, at: 0)
                self.resultTableView.reloadData()
            }
            HUD.hide()
        }
    }
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultDataArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let playerData = resultDataArray[indexPath.row]
        cell.playerNameAndScoreLabel.text = "\(playerData.playerName): \(playerData.score)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        playerName = resultDataArray[indexPath.row].playerName
        score = resultDataArray[indexPath.row].score
        basicPoint = resultDataArray[indexPath.row].basicPoint
        missPenalty = resultDataArray[indexPath.row].missPenalty
        timeBonus = resultDataArray[indexPath.row].timeBonus
        numberOfResponses = resultDataArray[indexPath.row].numberOfResponses
        accuracyRate = resultDataArray[indexPath.row].accuracyRate
        
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailRankerViewController
            detailVC.playerName = playerName
            detailVC.score = score
            detailVC.basicPoint = basicPoint
            detailVC.missPenalty = missPenalty
            detailVC.timeBonus = timeBonus
            detailVC.numberOfResponses = numberOfResponses
            detailVC.accuracyRate = accuracyRate
        }
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
