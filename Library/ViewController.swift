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
    var num: Int = 0
    var bookSaveData = UserDefaults.standard
    var bookDictonary: Dictionary<String, String> = [:]
    
    
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if bookSaveData.dictionary(forKey: "book") != nil{
        bookDictonary = bookSaveData.dictionary(forKey: "book") as! Dictionary<String, String>
        }
        num = bookDictonary.count
        let num_st: String = String(num)
         numberLabel.text = num_st
    }
    override func viewDidAppear(_ animated: Bool) {
        if bookSaveData.array(forKey: "book") != nil{
            bookDictonary = bookSaveData.dictionary(forKey: "book") as! Dictionary<String, String>
        }
        num = bookDictonary.count
        let num_st: String = String(num)
        numberLabel.text = num_st

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToTop(segue: UIStoryboardSegue){
       
       
    }



}

