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
    let bookSaveData = UserDefaults.standard
    var book: [Dictionary<String, String>] = []
    var keyArray: [String] = []
    var key = UserDefaults.standard
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        keyArray = key.array(forKey: "key") as! Array<String>
        if bookSaveData.array(forKey: "book") != nil{
            book = bookSaveData.array(forKey: "book") as! [Dictionary<String, String>]
            bookArray = [book[keyArray[0]]]
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

        
        return cellBook
        
    }
    
    @IBAction func backToBookList(segue: UIStoryboardSegue){
        
    }
    

  }
