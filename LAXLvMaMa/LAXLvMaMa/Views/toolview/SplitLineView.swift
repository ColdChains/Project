//
//  SplitLineView.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/17.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

//分割线视图
class SplitLineView: UIView {
    
    init(y: CGFloat) {
        super.init(frame: CGRect.init(x: 0, y: y, width: UIScreen.main.bounds.width, height: 1))
        self.backgroundColor = UIColor.lightGray
    }
    
    class func defaultSplitLineView(y: CGFloat) -> UIView {
        let view = UIView.init(frame: CGRect.init(x: 0, y: y, width: UIScreen.main.bounds.width, height: 1))
        view.backgroundColor = UIColor.lightGray
        return view
    }
    
    class func getSplitLineView(frame: CGRect) -> UIView {
        let view = UIView.init(frame: frame)
        view.backgroundColor = UIColor.lightGray
        return view
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
