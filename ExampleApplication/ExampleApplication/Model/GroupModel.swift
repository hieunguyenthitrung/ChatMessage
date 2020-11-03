//
//  GroupModel.swift
//  ExampleApplication
//
//  Created by Hieu Nguyen on 11/2/20.
//  Copyright © 2020 Hieu Nguyen Thi Trung. All rights reserved.
//

import Foundation
import UIKit

class Group : NSObject {
    var groupId:          String = ""
    var name:             String = ""
    var users:            [User]? = [User]()
    var histories:        [History]? = [History]()
    
    
    override init() {
        super.init()
    }
}
