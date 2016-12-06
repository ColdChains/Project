//
//  HeaderInSectionView.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/14.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

//段头视图
extension UIView {
    class func getHeaderInSectionView() -> HeaderInSectionView {
        return HeaderInSectionView.init(title: "限时抢购", frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 20))
    }
}

class HeaderInSectionView: UIView {
    
    var title = ""
    
    init(title: String, frame: CGRect) {
        
        super.init(frame: frame)
        
        self.title = title
        createView(w: frame.size.width)
        
        //self.backgroundColor = UIColor.lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView(w: CGFloat) {
        
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 5, height: 20))
        view.backgroundColor = UIColor.brown
        self.addSubview(view)
        
        let label = UILabel.init()
        label.frame = CGRect.init(x: 10, y: 0, width: 100, height: 20)
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = title
        self.addSubview(label)
        
        let button = UIButton.init()
        button.frame = CGRect.init(x: w - 66, y: 0, width: 66, height: 20)
        button.setTitle("更多", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
//        button.setImage(UIImage.init(named: "a"), for: .normal)
        //self.addSubview(button)
        
    }
    
}
