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
    var genreArray: [String] = []
    var row: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        bookSaveData.removeObject(forKey: "row")
        bookSaveData.set(row, forKey: "row")
        
        if bookSaveData.array(forKey: "genre") != nil{
            genreArray = bookSaveData.array(forKey: "genre") as! Array<String>
            if bookSaveData.array(forKey: genreArray[row]) != nil{
                bookArray = bookSaveData.array(forKey: genreArray[row]) as! Array<String>
                
            }
        }
        self.title = genreArray[row]

       
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            bookArray.remove(at: indexPath.row)
            bookSaveData.set(bookArray, forKey: genreArray[row])
                     
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
 
    
    
    
    @IBAction func backToBookList(segue: UIStoryboardSegue){
        
    }
    
    
}
