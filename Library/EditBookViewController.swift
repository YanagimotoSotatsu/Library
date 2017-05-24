//
//  EdidBookCollectionViewController.swift
//  Library
//
//  Created by 柳本宗達 on 2017/05/01.
//  Copyright © 2017年 柳本宗達. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class EdidBookViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet var bookTextField: UITextField!
    @IBOutlet var comentTextField: UITextField!
    var bookArray: [String] = []
    var nameArray: [String] = []
    var genreArray: [String] = []
    var coment: String = ""
    var bookSaveData = UserDefaults.standard
    var row: Int = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        row = bookSaveData.integer(forKey: "row")

        if bookSaveData.array(forKey: "genre") != nil{
            genreArray = bookSaveData.array(forKey: "genre") as! [String]
           
        }

            
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveBook(){
        var judge: Int = 0
        if bookTextField.text != nil{
            for i in 0..<genreArray.count {
                if bookSaveData.array(forKey: genreArray[i]) != nil{
                    bookArray = bookSaveData.array(forKey: genreArray[i]) as! [String]
                }
                for t in 0..<bookArray.count{
                if bookTextField.text! == bookArray[t]{
                    judge = 1
                }
            }
            }
            if judge == 0{
                if bookSaveData.array(forKey: genreArray[row]) != nil{
        nameArray = bookSaveData.array(forKey: genreArray[row]) as! [String]
                }else{
                    bookSaveData.set(nameArray, forKey: genreArray[row])
                }
        nameArray.append (bookTextField.text!)
        bookSaveData.set(nameArray, forKey: genreArray[row])
        if comentTextField.text != nil{
                coment = comentTextField.text!
                }
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
        
            }else{
                let alert = UIAlertController(
                    title: "すでにその本は保存されています",
                    message: "",
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil
                ))
                self.present(alert, animated: true, completion: nil)

                
            }
    }
    }
    func presentPickerController(sourceType: UIImagePickerControllerSourceType){
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = self
            self.present(picker,animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.dismiss(animated: true, completion: nil)
        bookSaveData.set(info[UIImagePickerControllerOriginalImage], forkey: bookTextField.text!)
        }
    
    
    

}
