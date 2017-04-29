//
//  EditGenreViewController.swift
//  Library
//
//  Created by 柳本宗達 on 2017/04/25.
//  Copyright © 2017年 柳本宗達. All rights reserved.
//

import UIKit

class EditGenreViewController: UIViewController {
    
    @IBOutlet var genreTextField: UITextField!
    var genreArray: [Dictionary<String, String>] = []
    var keyArray: [String] = []
    var key = UserDefaults.standard
    
    let genreSaveData = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if genreSaveData.array(forKey: "genre") != nil {
            genreArray = genreSaveData.array(forKey: "genre") as! [Dictionary<String, String>]
        }
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveGenre(){
        let genreDictionary = ["ジャンル": genreTextField.text!]
        let a = genreTextField.text

        genreArray.append(genreDictionary)
        genreSaveData.set(genreArray, forKey: "genre")
        keyArray.append(a!)
        key.set(keyArray, forKey: "key")
        
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "保存が完了しました",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil
        ))
        self.present(alert, animated: true, completion: nil)
        genreTextField.text = ""
        
    }
    
    
    
}
