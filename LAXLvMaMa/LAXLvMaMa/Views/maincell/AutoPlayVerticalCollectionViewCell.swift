//
//  AutoPlayVerticalCollectionViewCell.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/17.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class AutoPlayVerticalCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        label1.layer.masksToBounds = true
        label1.layer.borderWidth = 1
        label1.layer.borderColor = UIColor.orange.cgColor
    }

}
