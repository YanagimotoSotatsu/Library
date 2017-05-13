//
//  ViewController.swift
//  Library
//
//  Created by 柳本宗達 on 2017/04/22.
//  Copyright © 2017年 柳本宗達. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var numberLabel: UILabel!
    var bookSaveData = UserDefaults.standard
    var bookDictonary: Dictionary<String, String> = [:]
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if bookSaveData.dictionary(forKey: "book") != nil{
            bookDictonary = bookSaveData.dictionary(forKey: "book") as! Dictionary<String, String>
        }
        let num: String = String(bookDictonary.count)
        numberLabel.text = num
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToTop(segue: UIStoryboardSegue){
        
        
    }
    
    
    
}

