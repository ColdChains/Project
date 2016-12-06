//
//  ScenicSpotTableViewCell.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/24.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class ScenicSpotTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var marketPriceLabel: UILabel!
    
    @IBOutlet weak var tagNamesLabel: UILabel!
    @IBOutlet weak var youhuiLabel: UILabel!
    @IBOutlet weak var cashBackLabel: UILabel!
    @IBOutlet weak var commentGoodLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var provinceNameLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    
    var model = ScenicSpotModel() {
        didSet {
            
            if model.images == nil {
                return
            }
            
            imgView.af_setImage(withURL: URL.init(string: model.images!)!, placeholderImage: UIImage.init(named: "a"), filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.crossDissolve(0.5), runImageTransitionIfCached: true, completion: nil)
            
            nameLabel.text = model.name
            priceLabel.text = model.price!
            marketPriceLabel.text = "¥" + model.marketPrice!
            
            cashBackLabel.text = "返¥" + model.cashBack!
            commentGoodLabel.text = model.commentGood! + "满意"
            
            cityLabel.text = model.city
            provinceNameLabel.text = model.provinceName
            starLabel.text = model.star
            
            if model.tagNames != nil {
                tagNamesLabel.text = model.tagNames
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tagNamesLabel.layer.masksToBounds = true
        tagNamesLabel.layer.borderWidth = 1
        tagNamesLabel.layer.borderColor = UIColor.orange.cgColor
        
        youhuiLabel.layer.masksToBounds = true
        youhuiLabel.layer.borderWidth = 1
        youhuiLabel.layer.borderColor = UIColor.magenta.cgColor
        
        cashBackLabel.layer.masksToBounds = true
        cashBackLabel.layer.borderWidth = 1
        cashBackLabel.layer.borderColor = UIColor.magenta.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
