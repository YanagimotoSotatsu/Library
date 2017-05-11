//
//  BookListTableViewController.swift
//  Library
//
//  Created by 柳本宗達 on 2017/05/01.
//  Copyright © 2017年 柳本宗達. All rights reserved.
//

import UIKit

class BookListTableViewController: UITableViewController {

    var bookArray: [String] = []
    var comentArray: [String] = []
    let bookSaveData = UserDefaults.standard
    var bookDictionary: Dictionary<String, String> = [:]
    var comentDictionary: Dictionary<String, String> = [:]
    var keyArray: [String] = []
    var row: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        keyArray = bookSaveData.array(forKey: "key") as! Array<String>
        bookSaveData.removeObject(forKey: "row")
        bookSaveData.set(row, forKey: "row")
        if bookSaveData.array(forKey: "book") != nil{
            bookDictionary = bookSaveData.dictionary(forKey: "book") as! Dictionary<String, String>
            bookArray = [bookDictionary[keyArray[row]]!]
        }
            if bookSaveData.array(forKey: "coment") != nil{
            comentDictionary = bookSaveData.dictionary(forKey: "coment") as! Dictionary<String, String>
            comentArray = [comentDictionary[keyArray[row]]!]
        }

        tableView.reloadData()
        
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
//
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        // #warning Incomplete implementation, return the number of rows
        return bookArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellBook = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            as! BookTableViewCell
       
        
        cellBook.bookLabel.text = bookArray[indexPath.row]
        cellBook.comentLabel.text = comentArray[indexPath.row]

        
        return cellBook
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var i: Int
            bookArray.remove(at: indexPath.row)
            bookDictionary[keyArray[row]] = nil
            for i in 0..<bookArray.count{
                bookDictionary[keyArray[row]] = bookArray[i]
            }
            comentArray.remove(at: indexPath.row)
            comentDictionary[keyArray[row]] = nil
            for i in 0..<comentArray.count{
                comentDictionary[keyArray[row]] = comentArray[i]
            }
            bookSaveData.set(bookDictionary, forKey: "book")
            bookSaveData.set(comentDictionary, forKey: "coment")

            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    
    
    @IBAction func backToBookList(segue: UIStoryboardSegue){
        
    }
    

  }
