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
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct Fstore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
