//
//  ViewController.swift
//  MarubatsuApp
//
//  Created by 中坪久人 on 2018/10/27.
//  Copyright © 2018 中坪久人. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var Label: UILabel!
    
    
    
    var currentQuestionNum: Int = 0
    
    let questions:[[String:Any]] = [
    [
        "question":"iphoneアプリの開発環境はZcodeである","answer":false
    ],
    
    [
        "question":"xcode画面の右側にはユーティリティーズがある","answer":true

    ],
    [
        "question":"UILabelは文字列を表示する時に利用する","answer":true
    ]
]
    
    func showQuesion(){
        let question = questions[currentQuestionNum]
        
        if let que = question["question"] as? String{
            Label.text = que
        }
        
    }
    
    func checkAnswer(yourAnswer:Bool){
        let question = questions[currentQuestionNum]
        
        if let ans = question["answer"]as?Bool{
        
            if yourAnswer == ans{
                // 正解
                // currentQuestionNumを1足して次の問題に進む
                
                currentQuestionNum += 1
                showAlert(message: "正解")
                
            }else{
                //不正解
                showAlert(message: "不正解")
            }
        }
        
        if currentQuestionNum >= questions.count{
            currentQuestionNum = 0
        }
        
        showQuesion()
    }
    
    
    func showAlert(message: String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        alert.addAction(close)
        present(alert,animated: true,completion: nil)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showQuesion()

        
        
        
        
        
    }

    @IBAction func yesButton(_ sender: Any) {
        checkAnswer(yourAnswer: true)
    }
    
    @IBAction func noButton(_ sender: Any) {
        checkAnswer(yourAnswer: false)
        
    }
}

