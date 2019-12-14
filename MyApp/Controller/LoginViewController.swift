//
//  LoginViewController.swift
//  MyApp
//
//  Created by Zhixiang Tan on 2019/12/11.
//  Copyright © 2019 ZhixiangTan. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: Any) {
        if let email = email.text, let password = password.text{
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let e = error {
                    print("error",e)
                }else{
                    print("hello world")
                    self!.performSegue(withIdentifier: "moveToListView", sender: self)
                }
//              guard let strongSelf = self else { return }
              // ...
            }
        }
        
    }
    
}
