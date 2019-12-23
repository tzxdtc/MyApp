//
//  constants.swift
//  MyApp
//
//  Created by Zhixiang Tan on 2019/12/12.
//  Copyright © 2019 ZhixiangTan. All rights reserved.
//

import Foundation

struct K {
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let imageCellIdentifier = "imageCellIdentifier"
    static let imageCellName = "ImageCell"
    static let friendsCellIdentifier = "friendsCellIdentifier"
    static let friendsCellName = "FriendsCell"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct Fstore {
        static let collectionName = "messages"
        static let channelName = "channel"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
    
    struct ControllerIdentifier {
        static let chatViewIdentifier = "chatViewController"
    }
}
