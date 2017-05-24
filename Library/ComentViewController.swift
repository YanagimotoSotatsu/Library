//
//  ComentViewController.swift
//  Library
//
//  Created by 柳本宗達 on 2017/05/14.
//  Copyright © 2017年 柳本宗達. All rights reserved.
//

import UIKit

class ComentViewController: UIViewController ,UINavigationControllerDelegate,UIImagePickerControllerDelegate{

    var row: Int!
    var bookSaveData = UserDefaults.standard
    var bookArray: [String] = []
    var genreArray: [String] = []
    var rowGenre: Int = 0
    var coment: String = ""
    @IBOutlet var comentLabel: UILabel!
    @IBOutlet var photoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rowGenre = bookSaveData.integer(forKey: "row")
        genreArray = bookSaveData.array(forKey: "genre") as! [String]
        bookArray = bookSaveData.array(forKey: genreArray[rowGenre]) as! [String]
        coment = bookSaveData.string(forKey: bookArray[row])!
        comentLabel.text = coment
        
        
        self.title = bookArray[row]

        
        

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
