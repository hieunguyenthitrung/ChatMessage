//
//  HistoryModel.swift
//  ExampleApplication
//
//  Created by Hieu Nguyen on 11/2/20.
//  Copyright © 2020 Hieu Nguyen Thi Trung. All rights reserved.
//

import Foundation
import UIKit

class History : Decodable {
    var historyId:           String = ""
    var message:             String = ""
    var loveStatus:          Bool = false
    var isNew:               Bool = false
    var createTime:          String = ""
    var userId:              String = ""
}
