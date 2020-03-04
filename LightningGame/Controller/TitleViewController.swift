//
//  TitleViewController.swift
//  LightningGame
//
//  Created by Daisuke Orita on 2020/02/22.
//  Copyright © 2020 Daisuke Orita. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // startButtonの装飾
        startButton.layer.cornerRadius = 10
        startButton.layer.shadowOffset = CGSize(width: 6, height: 6 )
        startButton.layer.shadowOpacity = 2.0
        startButton.layer.shadowRadius = 10
        startButton.layer.shadowColor = UIColor.gray.cgColor
        
    }
    
    
    @IBAction func gameStart(_ sender: Any) {
        
        performSegue(withIdentifier: "toGame", sender: nil)
        
    }
    
    
    
    

    
}
