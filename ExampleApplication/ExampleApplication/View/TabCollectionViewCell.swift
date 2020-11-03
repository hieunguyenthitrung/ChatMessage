//
//  TabCollectionViewCell.swift
//  ExampleApplication
//
//  Created by Hieu Nguyen on 11/4/20.
//  Copyright © 2020 Hieu Nguyen Thi Trung. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class TabCollectionViewCell: UICollectionViewCell {

@IBOutlet weak var tabbarTitle: UILabel!
    override  func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
    }

    func setContentsForCell(_ title : String, index: Int){
        self.tabbarTitle.text = title
        if(index == 0){
            self.tabbarTitle.textColor = .white
        }else{
            self.tabbarTitle.textColor = UIColor.white.withAlphaComponent(0.3)
        }
    }
}
