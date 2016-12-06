//
//  AttractionModel.swift
//  LAXLMM
//
//  Created by 冰凉的枷锁 on 2016/10/10.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

//景点门票
class AttractionModel {
    
    var id: String?
    var title: String?
    var content: String?
    var price: String?
    var market_price: String?
    var large_image: String?
    
    var object_id: String?
    var sub_object_id: String?
    var begin_time: String?
    var end_time: String?
    var subject: String?
    
    var url: String?
    
    func show() {
        print(id, title)
    }
    
}
