//
//  FriendsListViewController.swift
//  MyApp
//
//  Created by Zhixiang Tan on 2019/12/19.
//  Copyright © 2019 ZhixiangTan. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class FriendsListViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    
    let db = Firestore.firestore()
    let currentUserUid = Auth.auth().currentUser?.uid
    
    var channels: [Channel] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadchannels()
        tableview.dataSource = self
        tableview.register(UINib(nibName: K.friendsCellName, bundle: nil), forCellReuseIdentifier: K.friendsCellIdentifier)
    }
    
    func loadchannels(){
        db.collection(K.Fstore.channelName)
            .addSnapshotListener { (querySnapshot, error) in
            self.channels = []
            if let e = error {
                print(e)
            }else{
                if let snapshotDocument = querySnapshot?.documents{
                    for doc in snapshotDocument{
                        let data = doc.data()
                        if let user1 = data["user1"] as? String,
                            let user2 = data["user1"] as? String,
                        let lastMessage = data["lastMessage"] as? String{
                            if self.currentUserUid == user1{
    
                                let channel = Channel(user: user2, lastMessage: lastMessage)
                                self.channels.append(channel)
                            }else if self.currentUserUid == user2{
                                let channel = Channel(user: user1, lastMessage: lastMessage)
                                self.channels.append(channel)
                            }
                            DispatchQueue.main.async {
                                self.tableview.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
    
}

extension FriendsListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("chan000",channels.count)
        return channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.friendsCellIdentifier, for: indexPath) as! FriendsCell
        print("channels",channels)
        let channel = channels[indexPath.row]
        
        cell.userName.text = channel.user
        cell.textContent.text = channel.lastMessage
        tableView.rowHeight = 100
        return cell
        
            }
    
    
}
