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
    var bookDictonary: [String] = []
    
    
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        bookDictonary = bookSaveData.array(forKey: "genre") as! [String]
//        num = bookDictonary.count
//        
//        let numa: String = String(num)
//         numberLabel.text = numa
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToTop(segue: UIStoryboardSegue){
        

    }



}

