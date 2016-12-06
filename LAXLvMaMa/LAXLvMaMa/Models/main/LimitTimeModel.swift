//
//  LimitTimeModel.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/13.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import Foundation

//限时抢购
class LimitTimeModel {
    
    var commentObjectId: String?
    var discount: String?
    var discountV200: String?//NSNumber
    var largeImage: String?//
    var marketPriceYuan: String?//NSNumber
    
    var productId: String?
    var productName: String?//
    var recommandName: String?
    var remainTimeDesc: String?
    
    var saleId: String?
    var sellPriceYuan: String?//NSNumber
    var stockCount: String?//NSNumber
    var smallImage: String?
    
    var branchType: String?
    var suppGoodsId: String?
    
    func show() {
        print(productName!)
    }
    
}
