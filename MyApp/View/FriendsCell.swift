//
//  FriendsCell.swift
//  MyApp
//
//  Created by Zhixiang Tan on 2019/12/19.
//  Copyright © 2019 ZhixiangTan. All rights reserved.
//

import UIKit

class FriendsCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var textContent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
