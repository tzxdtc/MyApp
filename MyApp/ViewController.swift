//
//  ViewController.swift
//  MyApp
//
//  Created by Zhixiang Tan on 2019/12/11.
//  Copyright © 2019 ZhixiangTan. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var register: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func registerTouch(_ sender: UIButton) {
        if let email = account.text, let password = password.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
              // ...
                print("error",error)
            }
            
        }
   
        print("hello world")
    }
    

}

