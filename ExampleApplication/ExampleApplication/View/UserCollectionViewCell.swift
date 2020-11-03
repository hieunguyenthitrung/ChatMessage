//
//  UserCollectionViewCell.swift
//  ExampleApplication
//
//  Created by Hieu Nguyen on 11/4/20.
//  Copyright © 2020 Hieu Nguyen Thi Trung. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
class UserCollectionViewCell: UICollectionViewCell {

@IBOutlet weak var avatarImageView: UIImageView!
@IBOutlet weak var nameLabel: UILabel!
@IBOutlet weak var dateLabel: UILabel!
@IBOutlet weak var newLabel: UILabel!
@IBOutlet weak var messageLabel: UILabel!
@IBOutlet weak var bgView: UIView!
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.newLabel.text = "New"
        self.newLabel.layer.cornerRadius = 10
        self.newLabel.layer.masksToBounds = true
        self.bgView.layer.cornerRadius = 25
        self.bgView.isHidden = true
        self.newLabel.isHidden = true
    }

    func setContentsForCell(_ history : History, user: User){
        
        self.nameLabel.text = user.name
        if(history.isNew){
            self.bgView.isHidden = false
            self.newLabel.isHidden = false
        }else{
            self.bgView.isHidden = true
            self.newLabel.isHidden = true
        }
        
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
        self.avatarImageView.sd_setImage(with: URL(string: user.avatar), placeholderImage:  UIImage(named: "profile_default"),options:SDWebImageOptions(), completed: { (image, error, cacheType, url) in
            if let image = image{
                self.avatarImageView.image = image.createRadius(self.avatarImageView.frame.size, radius: self.avatarImageView.frame.size.height/2, byRoundingCorners: UIRectCorner.allCorners)
                SDImageCache().store(image, forKey:user.avatar, toDisk: true)
            }
        })
    }
}
