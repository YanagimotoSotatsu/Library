//
//  GenreListTableViewController.swift
//  Library
//
//  Created by 柳本宗達 on 2017/04/22.
//  Copyright © 2017年 柳本宗達. All rights reserved.
//

import UIKit

class GenreListTableViewController: UITableViewController {
    
    var genreArray: [String] = []
    var genre = UserDefaults.standard
    let genreSaveData = UserDefaults.standard
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "GenreTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if genreSaveData.array(forKey: "genre") != nil {
            genreArray = genreSaveData.array(forKey: "genre") as! [String]
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
//        // #warning Incomplete implementation, return the number of rows
        return genreArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellGenre = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            as! GenreTableViewCell
        
        
        cellGenre.genreLabel.text = genreArray[indexPath.row]
        
        return cellGenre
        
    }
   
    override func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toBookList",sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toBookList") {
            let _: BookListTableViewController = (segue.destination as? BookListTableViewController)!
            
        }
    }

    
    
    @IBAction func backToGenreList(segue: UIStoryboardSegue){
        
    }

          

}
