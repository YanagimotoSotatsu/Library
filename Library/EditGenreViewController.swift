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
        var judge: Int = 0
        if genreTextField.text != nil{
            for i in 0..<genreArray.count {
                if genreTextField.text! == genreArray[i]{
                    judge = 1
                }
            }
            
            if judge == 0{
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
            }else{
                let alert = UIAlertController(
                    title: "すでにそのジャンルは保存されています",
                    message: "",
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil
                ))
                self.present(alert, animated: true, completion: nil)

                
            }
    }
    }
    
    
    
}
