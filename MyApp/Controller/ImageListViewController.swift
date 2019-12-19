//
//  ImageListViewController.swift
//  MyApp
//
//  Created by Zhixiang Tan on 2019/12/19.
//  Copyright © 2019 ZhixiangTan. All rights reserved.
//

import UIKit

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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let image = UIImage(named: "americaVisa")
        let cell = tableView.dequeueReusableCell(withIdentifier: K.imageCellIdentifier, for: indexPath) as! ImageCell
        cell.textView.text = "hello world"
        
        return cell
    }
    
   
}
