//
//  DestinationTableViewCell.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/17.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class DestinationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var keywordLabel: UILabel!
    @IBOutlet weak var title: UILabel!
    
    var model = DestinationModel() {
        didSet {
            
            imgView.af_setImage(withURL: URL.init(string: model.large_image!)!, placeholderImage: UIImage.init(named: "a"), filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.crossDissolve(0.5), runImageTransitionIfCached: true, completion: nil)
            
            keywordLabel.text = model.keyword
            title.text = model.title
            
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
