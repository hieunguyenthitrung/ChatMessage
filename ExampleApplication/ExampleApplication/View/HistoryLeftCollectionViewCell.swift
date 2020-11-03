//
//  HistoryLeftCollectionViewCell.swift
//  ExampleApplication
//
//  Created by Hieu Nguyen on 11/4/20.
//  Copyright © 2020 Hieu Nguyen Thi Trung. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
class HistoryLeftCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hearImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.white
        self.bgView.layer.cornerRadius = 15
    }

    func setContentsForCell(_ history : History){
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter
        }()
        
        let dateFormatter2: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "E"
            return formatter
        }()
        if(Utils.timeAgoSinceDate(history.createTime)){
            self.dateLabel.text = dateFormatter.string(from:Utils.convertStringDateToDate(history.createTime))
        }else{
            self.dateLabel.text = dateFormatter2.string(from:Utils.convertStringDateToDate(history.createTime))
        }
        
        self.messageLabel.text = history.message
    }
}

