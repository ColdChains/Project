//
//  MainDetailTableHeaderView.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/24.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class MainDetailTableHeaderView: UIView {
    
    var width: CGFloat = 414
    var height: CGFloat = 150
    
    var imageView: UIImageView!
    var title: UILabel!
    var comment: UILabel!
    var count: UILabel!

    init(f frame: CGRect) {
        
        super.init(frame: frame)
        self.width = frame.width
        self.height = frame.height
        
        imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: width, height: height))
        imageView.image = UIImage.init(named: "a")
        self.addSubview(imageView)
        
        title = UILabel.init(frame: CGRect.init(x: 10, y: height - 50, width: width / 5 * 4, height: 25))
        title.textColor = UIColor.white
        self.addSubview(title)
        
        comment = UILabel.init(frame: CGRect.init(x: 10, y: height - 20, width: width / 2, height: 20))
        comment.textColor = UIColor.white
        self.addSubview(comment)
        
        count = UILabel.init(frame: CGRect.init(x: width - 50, y: height - 20, width: 50, height: 20))
        count.textColor = UIColor.white
        count.textAlignment = .right
        self.addSubview(count)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
