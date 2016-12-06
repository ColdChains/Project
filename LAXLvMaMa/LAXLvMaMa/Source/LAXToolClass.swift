//
//  ToolClass.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/12.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import Foundation

class Tool {
    
    class func getTime() -> String {
        return String.init(format: "%f", Date.timeIntervalBetween1970AndReferenceDate)
    }
    
//    class func getSize(str: String) -> Int {
//        return (str as NSString).boundingRect(with: <#T##CGSize#>, options: <#T##NSStringDrawingOptions#>, attributes: <#T##[String : Any]?#>, context: <#T##NSStringDrawingContext?#>)
//        (with: CGSize.init(width: 414, height: 100), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14)], context: nil).size.width
//    }
    
}
    
