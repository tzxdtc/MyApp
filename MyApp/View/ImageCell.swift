//
//  ImageCell.swift
//  MyApp
//
//  Created by Zhixiang Tan on 2019/12/19.
//  Copyright © 2019 ZhixiangTan. All rights reserved.
//

import UIKit
import ImageSlideshow

class ImageCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var slideShow: ImageSlideshow!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
