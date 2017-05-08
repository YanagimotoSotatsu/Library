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
    @IBOutlet var comentTextField: UITextField!
    var bookDictionary: Dictionary<String, String> = [:]
    var comentDictionary: Dictionary<String, String> = [:]
    var genreArray: [String] = []
    var genre = UserDefaults.standard
    var bookSaveData = UserDefaults.standard
    var rowData = UserDefaults.standard
    var row: Int = 0
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if bookSaveData.array(forKey: "book") != nil {
            
            bookDictionary = bookSaveData.dictionary(forKey: "book") as! Dictionary<String, String>
        }
        if bookSaveData.array(forKey: "coment") != nil {
            
            comentDictionary = bookSaveData.dictionary(forKey: "coment") as! Dictionary<String, String>
        }

        row = rowData.integer(forKey: "row")
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveBook(){
        genreArray = genre.array(forKey: "genre") as! [String]

        bookDictionary[genreArray[row]] = bookTextField.text!
        comentDictionary[genreArray[row]] = comentTextField.text!
        bookSaveData.set(bookDictionary, forKey: "book")
        bookSaveData.set(comentDictionary, forKey: "coment")

        
        
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "保存が完了しました",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil
        ))
        self.present(alert, animated: true, completion: nil)
        bookTextField.text = ""
        comentTextField.text = ""
        
    }
    
    
    
    

}
