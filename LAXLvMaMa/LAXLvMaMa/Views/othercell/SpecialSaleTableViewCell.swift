//
//  SpecialSaleTableViewCell.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/17.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class SpecialSaleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var largeImageView: UIImageView!
    @IBOutlet weak var discountV200Button: UIButton!
    @IBOutlet weak var discountV200Label: UILabel!
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productTypeV2Label: UILabel!
    @IBOutlet weak var departurePlaceLabel: UILabel!
    
    @IBOutlet weak var marketPriceYuanLabel: UILabel!
    @IBOutlet weak var sellPriceYuanLabel: UILabel!
    @IBOutlet weak var stockCountLabel: UILabel!
    @IBOutlet weak var recommandNameLabel: UILabel!
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    var model = SpecialSaleModel() {
        didSet {
            
            largeImageView.af_setImage(withURL: URL.init(string: model.largeImage!)!, placeholderImage: UIImage.init(named: "a"), filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.crossDissolve(0.5), runImageTransitionIfCached: true, completion: nil)
            
            if model.discountV200 != nil {
                discountV200Button.setTitle(model.discountV200! + "折", for: .normal)
            }
            //discountV200Label.text = model.discountV200
            productNameLabel.text = model.productName
            productTypeV2Label.text = model.productTypeV2
            departurePlaceLabel.text = model.departurePlace
            
            marketPriceYuanLabel.text = model.sellPriceYuan
            sellPriceYuanLabel.text = model.marketPriceYuan
            stockCountLabel.text = model.stockCount
            recommandNameLabel.text = model.recommandName
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
