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
    var bookArray: Dictionary<String, String> = [:]
    var genreArray: [String] = []
    var genre = UserDefaults.standard
    var bookSaveData = UserDefaults.standard
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if bookSaveData.array(forKey: "book") != nil {
            
            bookArray = bookSaveData.dictionary(forKey: "book") as! Dictionary<String, String>
        }
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveBook(){
        genreArray = genre.array(forKey: "genre") as! [String]

        bookArray[genreArray[0]] = bookTextField.text!
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
