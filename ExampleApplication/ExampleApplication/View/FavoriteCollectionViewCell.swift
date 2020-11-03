//
//  FavoriteCollectionViewCell.swift
//  ExampleApplication
//
//  Created by Hieu Nguyen on 11/4/20.
//  Copyright © 2020 Hieu Nguyen Thi Trung. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
class FavoriteCollectionViewCell: UICollectionViewCell {

@IBOutlet weak var avatarImageView: UIImageView!
@IBOutlet weak var nameLabel: UILabel!

    override  func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
    }

    func setContentsForCell(_ user : User){
        
        self.nameLabel.text = user.name
        
        self.avatarImageView.sd_setImage(with: URL(string: user.avatar), placeholderImage:  UIImage(named: "profile_default"),options:SDWebImageOptions(), completed: { (image, error, cacheType, url) in
            if let image = image{
                self.avatarImageView.image = image.createRadius(self.avatarImageView.frame.size, radius: self.avatarImageView.frame.size.height/2, byRoundingCorners: UIRectCorner.allCorners)
                SDImageCache().store(image, forKey:user.avatar, toDisk: true)
            }
        })
    }
}

