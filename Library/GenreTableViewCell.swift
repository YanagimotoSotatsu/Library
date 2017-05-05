//
//  GenreTableViewCell.swift
//  Library
//
//  Created by 柳本宗達 on 2017/04/25.
//  Copyright © 2017年 柳本宗達. All rights reserved.
//

import UIKit

class GenreTableViewCell: UITableViewCell {
    
    @IBOutlet var genreLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
       
  }
