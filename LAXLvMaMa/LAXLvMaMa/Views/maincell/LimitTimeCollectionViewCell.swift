//
//  LimitTimeCollectionViewCell.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/13.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

//限时模块cell
class LimitTimeCollectionViewCell: UICollectionViewCell {
    
//    discountV200  largeImage  marketPriceYuan productName  sellPriceYuan stockCount
    @IBOutlet weak var discountV200Label: UIButton!
    
    @IBOutlet weak var stockCountLabel: UILabel!
    @IBOutlet weak var largeImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var marketPriceYuanLabel: UILabel!
    @IBOutlet weak var sellPriceYuanLabel: UILabel!
    
    var model = LimitTimeModel() {
        didSet {
            discountV200Label.setTitle(model.discountV200! + "折", for: .normal)
            stockCountLabel.text = "仅剩" + model.stockCount! + "份"
            
            productNameLabel.text = model.productName!
            marketPriceYuanLabel.text = "¥" + model.marketPriceYuan!
            sellPriceYuanLabel.text = model.sellPriceYuan!
            
            largeImageView.af_setImage(withURL: URL.init(string: model.largeImage!)!, placeholderImage: UIImage.init(named: "a"), filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.crossDissolve(0.5), runImageTransitionIfCached: true, completion: nil)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
