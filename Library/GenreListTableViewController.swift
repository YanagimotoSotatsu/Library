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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "BookList", sender: indexPath.row)
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?){
        if segue.identifier == "BookList"{
        let controller = segue.destination as! BookListTableViewController
        if let row = sender as? Int {
            controller.row = row
        }
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            genreArray.remove(at: indexPath.row)
            genreSaveData.set(genreArray, forKey: "genre")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
           @IBAction func backToGenreList(segue: UIStoryboardSegue){
        
    }

          

}
