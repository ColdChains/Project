//
//  DestinationModel.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/17.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import Foundation

//目的地
class DestinationModel {
    
    var id: String?
    var keyword: String?
    var title: String?
    var large_image: String?
    
    var back_word1: String?
    var object_id: String?
    
    func show() {
        print(id, title)
    }
    
}
