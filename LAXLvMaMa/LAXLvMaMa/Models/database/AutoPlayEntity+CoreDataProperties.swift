//
//  AutoPlayEntity+CoreDataProperties.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/31.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import Foundation
import CoreData


extension AutoPlayEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AutoPlayEntity> {
        return NSFetchRequest<AutoPlayEntity>(entityName: "AutoPlayEntity");
    }

    @NSManaged public var name: String?
    @NSManaged public var url: String?
    @NSManaged public var image: NSData?

}
