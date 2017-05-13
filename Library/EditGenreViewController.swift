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
    var genreArray: [String] = []
    
    let genreSaveData = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if genreSaveData.array(forKey: "genre") != nil {
            genreArray = genreSaveData.array(forKey: "genre") as! [String]
        }
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveGenre(){

        genreArray.append(genreTextField.text!)
        genreSaveData.set(genreArray, forKey: "genre")
        
        
        
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
