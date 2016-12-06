//
//  AttractionTableViewCell.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/11.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

//首页表格视图cell
class AttractionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var bodyLabel: UILabel!
    
    var model = AttractionModel() {
        didSet {
            nameLabel.text = model.title
            bodyLabel.text = model.content
            priceLabel.text = model.price
            
            bgImageView.af_setImage(withURL: URL.init(string: model.large_image!)!, placeholderImage: UIImage.init(named: "a"), filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.crossDissolve(0.5), runImageTransitionIfCached: true, completion: nil)
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
