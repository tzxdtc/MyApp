//
//  ImageListViewController.swift
//  MyApp
//
//  Created by Zhixiang Tan on 2019/12/19.
//  Copyright © 2019 ZhixiangTan. All rights reserved.
//

import UIKit
import ImageSlideshow

class ImageListViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.register(UINib(nibName: K.imageCellName, bundle: nil), forCellReuseIdentifier: K.imageCellIdentifier)
        
        
        // Do any additional setup after loading the view.
    }

}

extension ImageListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let image = UIImage(named: "americaVisa")
        let cell = tableView.dequeueReusableCell(withIdentifier: K.imageCellIdentifier, for: indexPath) as! ImageCell
        let image1 = UIImage(named: "1")!
        let image2 = UIImage(named: "americaVisa")!
        
        cell.textView.text = "hello world"
        cell.slideShow.setImageInputs([
            ImageSource(image:image1),
            ImageSource(image:image2)
        ])
        tableView.rowHeight = 400
        return cell
    }
}
