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
    var bookArray: [String] = []
    var genreArray: [String] = []
    var coment: String = ""
    var bookSaveData = UserDefaults.standard
    var row: Int = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        row = bookSaveData.integer(forKey: "row")

        if bookSaveData.array(forKey: "genre") != nil{
            genreArray = bookSaveData.array(forKey: "genre") as! [String]
            if bookSaveData.array(forKey: genreArray[row]) != nil {
                bookArray = bookSaveData.array(forKey: genreArray[row]) as! [String]
        }

            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveBook(){
        if bookTextField.text! != ""{
        bookArray.append (bookTextField.text!)
        bookSaveData.set(bookArray, forKey: genreArray[row])
        coment = comentTextField.text!
        bookSaveData.set(coment, forKey: bookTextField.text!)
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
    
    
    
    

}
