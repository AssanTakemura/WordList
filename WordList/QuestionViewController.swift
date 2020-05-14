//
//  QuestionViewController.swift
//  WordList
//
//  Created by 竹村明日香 on 2020/05/12.
//  Copyright © 2020 Takemura assan. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    var isAnsewred: Bool = false
    var wordArray: [Dictionary<String, String>] = []
    var nowNumber: Int = 0
    let saveDate = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wordArray = saveDate.array(forKey: "WORD") as! [Dictionary<String, String>]
        wordArray.shuffle()
        questionLabel.text = wordArray[nowNumber]["english"]
    }
    
    @IBAction func nextButtonTapped(){
        if isAnsewred{
            nowNumber += 1
            answerLabel.text = ""
            
            if nowNumber < wordArray.count {
                questionLabel.text = wordArray[nowNumber]["english"]
                isAnsewred = false
                nextButton.setTitle("答えを表示", for: .normal)
            } else {
                nowNumber = 0
                performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        } else {
            answerLabel.text = wordArray[nowNumber]["japanese"]
            isAnsewred = true
            nextButton.setTitle("次へ", for: .normal)
        }
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
