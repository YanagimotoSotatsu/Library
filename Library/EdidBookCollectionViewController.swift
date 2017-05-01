//
//  EdidBookCollectionViewController.swift
//  Library
//
//  Created by 柳本宗達 on 2017/05/01.
//  Copyright © 2017年 柳本宗達. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class EdidBookCollectionViewController: UICollectionViewController {

    @IBOutlet var bookTextField: UITextField!
    var bookDictionary: [Dictionary<String, String>] = []
    var bookArray: [String] = []
    var keyArray: [String] = []
    var key = UserDefaults.standard
    
    let bookSaveData = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if bookSaveData.array(forKey: "book") != nil {
            bookDictionary = bookSaveData.array(forKey: "book") as! [Dictionary<String, String>]
        }
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveBook(){
        
        bookArray.append(bookTextField.text!)
        bookDictionary.set(bookArray, forkey: keyArray[])
        bookSaveData.set(bookDictionary, forKey: "book")
        
        
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