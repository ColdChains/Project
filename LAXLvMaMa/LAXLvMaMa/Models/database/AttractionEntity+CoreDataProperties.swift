//
//  AttractionEntity+CoreDataProperties.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/11/1.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import Foundation
import CoreData


extension AttractionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AttractionEntity> {
        return NSFetchRequest<AttractionEntity>(entityName: "AttractionEntity");
    }

    @NSManaged public var object_id: String?
    @NSManaged public var title: String?

}
