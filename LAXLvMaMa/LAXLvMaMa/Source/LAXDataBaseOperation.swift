//
//  UserOperation.swift
//  bUserManagerCoreData
//
//  Created by 冰凉的枷锁 on 16/9/21.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit
import CoreData

class LAXDataBaseOperation {
    
    private static let context = NSManagedObjectContext.init(concurrencyType: .mainQueueConcurrencyType)
    
    static func bindModelWithDataBase() {
        
        let dpath = NSHomeDirectory().appending("/Documents/LAXLvMaMaModel.db")
        let mpath = Bundle.main.path(forResource: "LAXLvMaMaModel", ofType: "momd")
        let model = NSManagedObjectModel.init(contentsOf: URL.init(fileURLWithPath: mpath!))
        
        let coord = NSPersistentStoreCoordinator.init(managedObjectModel: model!)
        try! coord.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: URL.init(fileURLWithPath: dpath), options: nil)
        context.persistentStoreCoordinator = coord
        
    }
    
    static func insertAutoPlayEntity(name: String, url: String, image: NSData) {
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "AutoPlayEntity", into: context) as! AutoPlayEntity
        entity.name = name
        entity.url = url
        entity.image = image
        try! context.save()
        
    }
    
    static func insertAutoPlayEntity(model: AutoPlayEntity) {
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "AutoPlayEntity", into: context) as! AutoPlayEntity
        entity.name = model.name
        entity.url = model.url
        entity.image = model.image
        try! context.save()
        
    }
    
    static func deleteAutoPlayEntity(i: Int) {
        
        let request = NSFetchRequest<NSFetchRequestResult>.init()
        let entity = NSEntityDescription.entity(forEntityName: "AutoPlayEntity", in: context)
        request.entity = entity
        let res = try! context.fetch(request)
        let model = res[i] as! AutoPlayEntity
        context.delete(model)
        try! context.save()
        
    }
    
    static func deleteAutoPlayEntity(url: String) {
        
        let request = NSFetchRequest<NSFetchRequestResult>.init()
        let entity = NSEntityDescription.entity(forEntityName: "AutoPlayEntity", in: context)
        request.entity = entity
        let res = try! context.fetch(request)
        for i in res {
            let model = i as! AutoPlayEntity
            if model.url == url {
                context.delete(model)
            }
        }
        try! context.save()
        
    }
    
    static func updateAutoPlayEntity(i: Int, name: String, url: String, image: NSData) {
        
        let request = NSFetchRequest<NSFetchRequestResult>.init()
        let entity = NSEntityDescription.entity(forEntityName: "AutoPlayEntity", in: context)
        request.entity = entity
        let res = try! context.fetch(request)
        let model = res[i] as! AutoPlayEntity
        model.name = name
        model.url = url
        model.image = image
        try! context.save()
        
    }
    
    static func selectOneAutoPlayEntity(url: String) -> AutoPlayEntity? {
        
        let request = NSFetchRequest<NSFetchRequestResult>.init()
        let entity = NSEntityDescription.entity(forEntityName: "AutoPlayEntity", in: context)
        request.entity = entity
        let res = try! context.fetch(request)
        for i in res {
            let model = i as! AutoPlayEntity
            if model.url == url {
                return model
            }
        }
        return nil
    }
    
    static func selectAllAutoPlayEntity() -> [AutoPlayEntity] {
        
        var arr = [AutoPlayEntity]()
        let request = NSFetchRequest<NSFetchRequestResult>.init()
        let entity = NSEntityDescription.entity(forEntityName: "AutoPlayEntity", in: context)
        request.entity = entity
        let res = try! context.fetch(request)
        for i in res {
            let model = i as! AutoPlayEntity
            arr.append(model)
        }
        return arr
        
    }
    
    //MARK: - AutoPlay
    
    static func insertAutoPlayEntity(dataArr: [String], nameArr: [String], imageArr: [NSData]) {
        
        for i in 0..<dataArr.count {
            let entity = NSEntityDescription.insertNewObject(forEntityName: "AutoPlayEntity", into: context) as! AutoPlayEntity
            entity.name = nameArr[i]
            entity.url = dataArr[i]
            entity.image = imageArr[i]
            try! context.save()
        }
        
    }
    
    static func selectAllImageAutoPlayEntity() -> ([UIImage], [String], [String]) {
        
        var dataArr = [String]()
        var nameArr = [String]()
        var imageArr = [UIImage]()
        
        let request = NSFetchRequest<NSFetchRequestResult>.init()
        let entity = NSEntityDescription.entity(forEntityName: "AutoPlayEntity", in: context)
        request.entity = entity
        let res = try! context.fetch(request)
        for i in res {
            let model = i as! AutoPlayEntity
            let image = UIImage.init(data: model.image! as Data)
            imageArr.append(image!)
            dataArr.append(model.url!)
            nameArr.append(model.name!)
        }
        return (imageArr, dataArr, nameArr)
        
    }
    
    //MARK: - LimitTimeModel
    
    static func insertLimitTimeEntity(model: LimitTimeModel) {
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "LimitTimeEntity", into: context) as! LimitTimeEntity
        entity.productName = model.productName
        entity.productId = model.productId
        entity.suppGoodsId = model.suppGoodsId
        entity.branchType = model.branchType
        try! context.save()
        
    }
    
    static func deleteLimitTimeEntity(model: LimitTimeModel) {
        
        let request = NSFetchRequest<NSFetchRequestResult>.init()
        let entity = NSEntityDescription.entity(forEntityName: "LimitTimeEntity", in: context)
        request.entity = entity
        let res = try! context.fetch(request)
        for i in res {
            if model.productId == (i as! LimitTimeEntity).productId {
                context.delete(i as! LimitTimeEntity)
            }
        }
        try! context.save()
        
    }
    
    static func selectAllLimitTimeEntity() -> [LimitTimeModel] {
        
        var arr = [LimitTimeModel]()
        let request = NSFetchRequest<NSFetchRequestResult>.init()
        let entity = NSEntityDescription.entity(forEntityName: "LimitTimeEntity", in: context)
        request.entity = entity
        let res = try! context.fetch(request)
        for i in res {
            let model = LimitTimeModel()
            model.productName = (i as! LimitTimeEntity).productName
            model.productId = (i as! LimitTimeEntity).productId
            model.suppGoodsId = (i as! LimitTimeEntity).suppGoodsId
            model.branchType = (i as! LimitTimeEntity).branchType
            arr.append(model)
        }
        return arr
        
    }
    
    static func selectOneLimitTimeEntity(model: LimitTimeModel) -> Bool {
        
        let request = NSFetchRequest<NSFetchRequestResult>.init()
        let entity = NSEntityDescription.entity(forEntityName: "LimitTimeEntity", in: context)
        request.entity = entity
        let res = try! context.fetch(request)
        for i in res {
            let ent = i as! LimitTimeEntity
            if model.productId == ent.productId && model.suppGoodsId == ent.suppGoodsId && model.branchType == ent.branchType {
                return true
            }
        }
        return false
    }
    
    //MARK: - AttractionModel
    
    static func insertAttractionEntity(model: AttractionModel) {
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "AttractionEntity", into: context) as! AttractionEntity
        entity.object_id = model.object_id
        entity.title = model.title
        try! context.save()
        
    }
    
    static func deleteAttractionEntity(model: AttractionModel) {
        
        let request = NSFetchRequest<NSFetchRequestResult>.init()
        let entity = NSEntityDescription.entity(forEntityName: "AttractionEntity", in: context)
        request.entity = entity
        let res = try! context.fetch(request)
        for i in res {
            if model.object_id == (i as! AttractionEntity).object_id {
                context.delete(i as! AttractionEntity)
            }
        }
        try! context.save()
        
    }
    
    static func selectAllAttractionEntity() -> [AttractionModel] {
        
        var arr = [AttractionModel]()
        let request = NSFetchRequest<NSFetchRequestResult>.init()
        let entity = NSEntityDescription.entity(forEntityName: "AttractionEntity", in: context)
        request.entity = entity
        let res = try! context.fetch(request)
        for i in res {
            let model = AttractionModel()
            model.object_id = (i as! AttractionEntity).object_id
            model.title = (i as! AttractionEntity).title
            arr.append(model)
        }
        return arr
        
    }
    
    static func selectAllAttractionEntity() -> [ScenicSpotModel] {
        
        var arr = [ScenicSpotModel]()
        let request = NSFetchRequest<NSFetchRequestResult>.init()
        let entity = NSEntityDescription.entity(forEntityName: "AttractionEntity", in: context)
        request.entity = entity
        let res = try! context.fetch(request)
        for i in res {
            let model = ScenicSpotModel()
            model.productId = (i as! AttractionEntity).object_id
            model.provinceName = (i as! AttractionEntity).title
            arr.append(model)
        }
        return arr
        
    }
    
    static func selectOneAttractionEntity(model: AttractionModel) -> Bool {
        
        let request = NSFetchRequest<NSFetchRequestResult>.init()
        let entity = NSEntityDescription.entity(forEntityName: "AttractionEntity", in: context)
        request.entity = entity
        let res = try! context.fetch(request)
        for i in res {
            let ent = i as! AttractionEntity
            if model.object_id == ent.object_id {
                return true
            }
        }
        return false
    }
    
    static func selectOneAttractionEntity(model: ScenicSpotModel) -> Bool {
        
        let request = NSFetchRequest<NSFetchRequestResult>.init()
        let entity = NSEntityDescription.entity(forEntityName: "AttractionEntity", in: context)
        request.entity = entity
        let res = try! context.fetch(request)
        for i in res {
            let ent = i as! AttractionEntity
            if model.productId == ent.object_id {
                return true
            }
        }
        return false
    }
    
}
