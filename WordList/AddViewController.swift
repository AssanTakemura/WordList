//
//  AddViewController.swift
//  WordList
//
//  Created by 竹村明日香 on 2020/05/12.
//  Copyright © 2020 Takemura assan. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japanTextFiled: UITextField!
    
    var wordArray: [Dictionary<String,String>] = []
    
    let saveDate = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if saveDate.array(forKey: "WORD") != nil{
            wordArray = saveDate.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveWord(){
        let wordDictionary = ["english": englishTextField.text!, "japanese": japanTextFiled.text!]
        
        wordArray.append(wordDictionary)
        saveDate.set(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "単語の登録が完了しました",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        ))
        
        present(alert, animated: true, completion: nil)
        englishTextField.text = ""
        japanTextFiled.text = ""
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
