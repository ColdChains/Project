//
//  LimitTimeEntity+CoreDataProperties.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/11/1.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import Foundation
import CoreData


extension LimitTimeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LimitTimeEntity> {
        return NSFetchRequest<LimitTimeEntity>(entityName: "LimitTimeEntity");
    }

    @NSManaged public var branchType: String?
    @NSManaged public var productId: String?
    @NSManaged public var suppGoodsId: String?
    @NSManaged public var productName: String?

}
