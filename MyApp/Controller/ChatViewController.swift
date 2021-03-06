//
//  ChatViewController.swift
//  MyApp
//
//  Created by Zhixiang Tan on 2019/12/12.
//  Copyright © 2019 ZhixiangTan. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    var channerId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
    }
    
    func loadMessages(){
        db.collection("channel/\(channerId ?? "")/thread")
            .order(by: K.Fstore.dateField)
            .addSnapshotListener { (querySnapshot, error) in
            self.messages = []
            if let e = error {
                print(e)
            }else {
                if let snapshotDocument = querySnapshot?.documents {
                    for doc in snapshotDocument{
                        let data = doc.data()
                        if let messageSender = data[K.Fstore.senderField] as? String, let messageBody = data[K.Fstore.bodyField] as? String {
                        let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            DispatchQueue.main.async {
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.reloadData()
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: Any) {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email{
            db.collection("channel/\(channerId ?? "")/thread").addDocument(data: [
                K.Fstore.bodyField: messageBody,
                K.Fstore.senderField: messageSender,
                K.Fstore.dateField: Date().timeIntervalSince1970
            ]) { (Error) in
                if let e = Error {
                    print(e)
                }else{
                    DispatchQueue.main.async{
                        self.messageTextfield.text = ""
                    }
                }
            }
        }
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("message",messages.count)
        return messages.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = message.body
        
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
        }else{
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
        }
        return cell
    }
}
