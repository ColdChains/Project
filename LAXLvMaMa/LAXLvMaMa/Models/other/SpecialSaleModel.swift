//
//  SpecialSaleModel.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/17.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import Foundation

//特卖
class SpecialSaleModel {
    
    var labelHeight: Float?
    
    var commentObjectId: String?
    var largeImage: String?
    var discountV200: String?//NSNumber
    
    //
    var productName: String?
    var productTypeV2: String?
    var departurePlace: String?
    
    var marketPriceYuan: String?//NSNumber
    var sellPriceYuan: String?//NSNumber
    var stockCount: String?//NSNumber
    var recommandName: String?
    
    //
    var secKillEndSeconds: String?//NSNumber
    var secKillEndTime: String?
    var secKillStartTime: String?
    var buttonText: String?
    
    var productId: String?
    var suppGoodsId: String?
    var branchType: String?
    
    func show() {
        print(recommandName)
    }
    
}
