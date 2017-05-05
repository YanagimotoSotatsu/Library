//
//  EdidBookCollectionViewController.swift
//  Library
//
//  Created by 柳本宗達 on 2017/05/01.
//  Copyright © 2017年 柳本宗達. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class EdidBookViewController: UIViewController {

    @IBOutlet var bookTextField: UITextField!
    var bookArray: [Dictionary<String, String>] = []
    var keyName: Array<String> = []
    var key = UserDefaults.standard
    var bookSaveData = UserDefaults.standard
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if bookSaveData.array(forKey: "book") != nil {
            bookArray = bookSaveData.array(forKey: "book") as! [Dictionary<String, String>]
        }
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveBook(){
        keyName = key.array(forKey: "key") as! Array<String>

        let bookDictionary = [keyName[0] : bookTextField.text!]
        bookArray.append(bookDictionary)
        bookSaveData.set(bookArray, forKey: "book")
        
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "保存が完了しました",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil
        ))
        self.present(alert, animated: true, completion: nil)
        bookTextField.text = ""
        
    }
    
    
    
    

}
