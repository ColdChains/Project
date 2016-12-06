//
//  ScenicSpotModel.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/24.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import Foundation

class ScenicSpotModel {
    
    var productId: String?//NSNumber
    var name: String?
    var images: String?
    
    var price: String?//NSNumber
    var marketPrice: String?//NSNumber
    
    var cashBack: String?
    var commentGood: String?
    
    var city: String?
    var provinceName: String?
    var star: String?
    
    var tagNames: String?
    
    func show() {
        print(name!)
    }
    
}
