//
//  LimitTimeDetailHeaderView.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/26.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class LimitTimeDetailHeaderView: UIView {

    var width: CGFloat = 414
    var height: CGFloat = 150
    
    
    var title: UILabel!
    var sellPriceYuanLabel: UILabel!
    var orderCountLabel: UILabel!
    
    init(f frame: CGRect) {
        
        super.init(frame: frame)
        self.width = frame.width
        self.height = frame.height
        
        title = UILabel.init(frame: CGRect.init(x: 10, y: 10, width: width - 20, height: 42))
        self.addSubview(title)
        
        sellPriceYuanLabel = UILabel.init(frame: CGRect.init(x: 10, y: 60, width: 100, height: 20))
        self.addSubview(sellPriceYuanLabel)
        
        orderCountLabel = UILabel.init(frame: CGRect.init(x: width - 150, y: 60, width: 150, height: 20))
        orderCountLabel.font = UIFont.systemFont(ofSize: 14)
        orderCountLabel.textAlignment = .right
        self.addSubview(orderCountLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
