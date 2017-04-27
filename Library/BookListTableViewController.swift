//
//  BookListTableViewController.swift
//  Library
//
//  Created by 柳本宗達 on 2017/04/22.
//  Copyright © 2017年 柳本宗達. All rights reserved.
//

import UIKit

class BookListTableViewController: UITableViewController {
    
    var bookArray: [Dictionary<String, String>] = [] 

    
    let bookSaveData = UserDefaults.standard
   
    


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
               
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if bookSaveData.array(forKey: "book") != nil{
            bookArray = bookSaveData.array(forKey: "book") as! [Dictionary<String, String>]
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellBook = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            as! BookTableViewCell
        let nowIndexPathDictionary = bookArray[indexPath.row]
        
        cellBook.bookLabel.text = nowIndexPathDictionary["題名"]
        
        return cellBook
        
    }

   
}
