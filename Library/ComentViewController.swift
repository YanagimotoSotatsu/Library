//
//  ComentViewController.swift
//  Library
//
//  Created by 柳本宗達 on 2017/05/13.
//  Copyright © 2017年 柳本宗達. All rights reserved.
//

import UIKit

class ComentViewController: UIViewController {
    @IBOutlet var comentLabel: UILabel!
    var bookName: Int!
    var bookSaveData = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
