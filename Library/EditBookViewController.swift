//
//  EditBookViewController.swift
//  Library
//
//  Created by 柳本宗達 on 2017/04/25.
//  Copyright © 2017年 柳本宗達. All rights reserved.
//

import UIKit

class EditBookViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField!
    
    var titleArray: [Dictionary<String, String>] = []
    
    let titleSaveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        if titleSaveData.array(forKey: "title") != nil {
            titleArray = titleSaveData.array(forKey: "title") as! [Dictionary<String, String>]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveTitle(){
        let titleDictionary = ["タイトル": titleTextField.text!]
        titleArray.append(titleDictionary)
        titleSaveData.set(titleArray, forKey: "title")
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "保存が完了しました",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil
        ))
        self.present(alert, animated: true, completion: nil)
        titleTextField.text = ""
        
    }
    
}
