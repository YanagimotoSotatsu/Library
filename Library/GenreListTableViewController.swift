//
//  GenreListTableViewController.swift
//  Library
//
//  Created by 柳本宗達 on 2017/04/22.
//  Copyright © 2017年 柳本宗達. All rights reserved.
//

import UIKit

class GenreListTableViewController: UITableViewController {
    
    var genreArray: [Dictionary<String, String>] = []
    let genreSaveData = UserDefaults.standard
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "GenreTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if genreSaveData.array(forKey: "genre") != nil{
            genreArray = genreSaveData.array(forKey: "genre") as! [Dictionary<String, String>]
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
        let nowIndexPathDictionary = genreArray[indexPath.row]
        
        cellGenre.genreLabel.text = nowIndexPathDictionary["ジャンル"]
        
        return cellGenre
        
    }
    
    @IBAction func backToGenreList(segue: UIStoryboardSegue){
        
    }

          

}
