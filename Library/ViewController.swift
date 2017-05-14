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
    var num: Int = 0
    var num_st: String = ""
    var genreArray: [String] = []
    var bookArray: [String] = []
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var num: Int = 0
        if bookSaveData.array(forKey: "genre") != nil{
            genreArray = bookSaveData.array(forKey: "genre") as! [String]
        }
            for i in 0..<genreArray.count  {
                if  bookSaveData.array(forKey: genreArray[i]) != nil{
                    bookArray = bookSaveData.array(forKey: genreArray[i]) as! [String]
                    num = num + bookArray.count
                          }


        }
        
        
        num_st = num.description
        
        numberLabel.text = num_st
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToTop(segue: UIStoryboardSegue){
        
        
    }
    
    
    
}

