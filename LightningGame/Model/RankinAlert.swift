//
//  RankinAlert.swift
//  LightningGame
//
//  Created by Daisuke Orita on 2020/02/27.
//  Copyright © 2020 Daisuke Orita. All rights reserved.
//

import Foundation
import UIKit

class RankinAlert: UIViewController {
    
    let alert = UIAlertController()
    var playerName = String()
    var alertTextField = UITextField()

    func rankin() {
        //アラートコントローラー
        let alert = UIAlertController(title: "ランクインしました‼︎", message: "あなたの名前を入力してください", preferredStyle: .alert)
        
        //OKボタンを生成
        let okAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
            //複数のtextFieldのテキストを格納
            guard let text = self.alertTextField.text else { return }
            self.playerName = text
        }
        //OKボタンを追加
        alert.addAction(okAction)
        
        //Cancelボタン生成&追加
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        //TextFieldを追加
        alert.addTextField { (text:UITextField!) in
            self.alertTextField = text
            text.placeholder = "好きな名前を入力してね"
        }
        
        //アラートを表示
        present(alert, animated: true, completion: nil)
    }
}
