//
//  LAXAlamaofire.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/12.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class LAXAlamofire {
    
    // MARK: - CityList
    class func requestCityList(str: String, success: @escaping ([CityList]) -> Void, error: @escaping (String) -> Void) {
        
        var muarr = [CityList]()
        Alamofire.request(str).responseJSON { (response) in
            if let json = response.result.value {
                
                let object = json as! [String: AnyObject]
                if let array = object["data"] as? [[String: AnyObject]] {
                    
                    for dic in array {
                        let model = CityList()
                        model.id = dic["id"] as? String
                        model.isHot = dic["isHot"] as? String
                        model.name = dic["name"] as? String
                        model.pinyin = dic["pinyin"] as? String
                        model.provinceName = dic["provinceName"] as? String
                        model.shortPinyin = dic["shortPinyin"] as? String
                        muarr.append(model)
                    }
                }
                
                success(muarr)
                
            } else {
                //error(response.result.description)
                error("网络不给力，请稍后再试")
            }
        }
        
    }
    
    class func requestCityListArr(str: String, success: @escaping ([Dictionary<String, String>]) -> Void, error: @escaping (String) -> Void) {
        
        var muarr = [Dictionary<String, String>]()
        Alamofire.request(str).responseJSON { (response) in
            if let json = response.result.value {
                
                let object = json as! [String: AnyObject]
                if let array = object["data"] as? [[String: String]] {
                    
                    for dictionary in array {
                        muarr.append(dictionary)
                    }
                }
                
                success(muarr)
                
            } else {
                //error(response.description)
                error("网络不给力，请稍后再试")
            }
        }
        
    }
    
    // MARK: - AotoPlay CollectionView 轮播图
    
    class func requestAotoPlay(str: String, success: @escaping ([String], [String]) -> Void, error: @escaping (String) -> Void) {
        
        var muarr = [String]()
        var name = [String]()
        Alamofire.request(str).responseJSON { (response) in
            if let json = response.result.value {
                
                let object = json as! [String: AnyObject]
                if let dictionary = (object["datas"] as? [[String: AnyObject]])?.first {
                    let arr = dictionary["infos"] as! [[String: AnyObject]]
                    
                    for dic in arr {
                        muarr.append(dic["large_image"] as! String)
                        name.append(dic["title"] as! String)
                    }
                }
                
                success(muarr, name)
                
            } else {
                //error(response.description)
                error("网络不给力，请稍后再试")
            }
        }
        
    }
    
    // MARK: -  景点门票 详情
    
    class func requestScenicSpotDetail(str: String, success: @escaping ([ScenicSpotModel]) -> Void, error: @escaping (String) -> Void) {
        
        var muarr = [ScenicSpotModel]()
        Alamofire.request(str).responseJSON { (response) in
            if let json = response.result.value {
                
                let object = json as! [String: AnyObject]
                if let array = object["datas"] as? [[String: AnyObject]] {
                    
                    for dic in array {
                        let model = ScenicSpotModel()
                        
                        model.productId = "\(dic["productId"] as! NSNumber)"
                        model.name = dic["name"] as? String
                        model.images = dic["images"] as? String
                        model.price = "\(dic["price"] as! NSNumber)"
                        model.marketPrice = "\(dic["marketPrice"] as! NSNumber)"
                        
                        model.cashBack = "\(dic["cashBack"] as! NSNumber)"
                        model.commentGood = dic["commentGood"] as? String
                        model.city = dic["city"] as? String
                        model.provinceName = dic["provinceName"] as? String
                        model.star = dic["star"] as? String
                        
                        if let tag = dic["tagNames"] {
                            model.tagNames = (tag as! [String]).first
                        }
                        
                        muarr.append(model)
                    }
                }
                
                success(muarr)
                
            } else {
                //error(response.description)
                error("网络不给力，请稍后再试")
            }
        }
        
    }
    
    // MARK: - LimitTime CollectionView 热门推荐
    
    class func requestHotRecommond(str: String, success: @escaping ([AttractionModel]) -> Void, error: @escaping (String) -> Void) {
        
        var muarr = [AttractionModel]()
        Alamofire.request(str).responseJSON { (response) in
            if let json = response.result.value {
                
                let object = json as! [String: AnyObject]
                if let array = object["datas"] as? [[String: AnyObject]] {
                    
                    let dictionary1 = array[1]
                    let arr1 = dictionary1["infos"] as! [[String: AnyObject]]
                    for dic in arr1 {
                        let model = AttractionModel()
                        model.id = dic["id"] as! String?
                        model.title = dic["title"] as! String?
                        model.url = dic["url"] as! String?
                        model.large_image = dic["large_image"] as! String?
                        muarr.append(model)
                    }
                    
                    let dictionary2 = array[2]
                    var arr2 = dictionary2["infos"] as! [[String: AnyObject]]
                    arr2.remove(at: 1)
                    for dic in arr2 {
                        let model = AttractionModel()
                        model.id = dic["id"] as! String?
                        model.title = dic["title"] as! String?
                        model.url = dic["url"] as! String?
                        model.large_image = dic["large_image"] as! String?
                        muarr.append(model)
                    }
                    
                    let dictionary3 = array[3]
                    let arr3 = dictionary3["infos"] as! [[String: AnyObject]]
                    for dic in arr3 {
                        let model = AttractionModel()
                        model.id = dic["id"] as! String?
                        model.title = dic["title"] as! String?
                        model.url = dic["url"] as! String?
                        model.large_image = dic["large_image"] as! String?
                        muarr.append(model)
                    }
                }
                
                success(muarr)
                
            } else {
                //error(response.description)
                error("网络不给力，请稍后再试")
            }
        }
        
    }
    
    // MARK: - PhoneEnjoy CollectionView 手机专享
    
    class func requestPhoneEnjoy(str: String, success: @escaping ([AttractionModel]) -> Void, error: @escaping (String) -> Void) {
        
        var muarr = [AttractionModel]()
        Alamofire.request(str).responseJSON { (response) in
            if let json = response.result.value {
                
                let object = json as! [String: AnyObject]
                if let array = object["datas"] as? [[String: AnyObject]] {
                    
                    let dictionary0 = array[0]
                    
                    let arr = dictionary0["infos"] as! [[String: AnyObject]]
                    
                    for dic in arr {
                        
                        let model = AttractionModel()
                        model.id = dic["id"] as? String
                        model.title = dic["title"] as? String
                        model.url = dic["url"] as? String
                        model.large_image = dic["large_image"] as? String
                        muarr.append(model)
                        
                    }
                }
                
                success(muarr)
                
            } else {
                //error(response.description)
                error("网络不给力，请稍后再试")
            }
        }
        
    }
    
    // MARK: - LimitTime CollectionView 限时抢购
    
    class func requestLimitTime(str: String, success: @escaping ([LimitTimeModel]) -> Void, error: @escaping (String) -> Void) {
        
        var muarr = [LimitTimeModel]()
        Alamofire.request(str).responseJSON { (response) in
            if let json = response.result.value {
                
                let object = json as! [String: AnyObject]
                if let dictionary = object["data"] as? [String: AnyObject] {
                    
                    
                    if let arr = dictionary["secKillOnlyList"] as? [[String: AnyObject]] {
                        
                        for dic in arr {
                            
                            let model = LimitTimeModel()
                            model.discountV200 = "\(dic["discountV200"] as! NSNumber)"
                            model.largeImage = dic["largeImage"] as? String
                            model.marketPriceYuan = "\(dic["marketPriceYuan"] as! NSNumber)"
                            model.productName = dic["productName"] as? String
                            model.sellPriceYuan = "\(dic["sellPriceYuan"] as! NSNumber)"
                            model.stockCount = "\(dic["stockCount"] as! NSNumber)"
                            
                            model.productId = "\(dic["productId"] as! NSNumber)"
                            model.suppGoodsId = "\(dic["suppGoodsId"] as! NSNumber)"
                            model.branchType = dic["branchType"] as? String
                            muarr.append(model)
                            
                        }
                    }
                }
                success(muarr)
                
            } else {
                //error(response.description)
                error("网络不给力，请稍后再试")
            }
        }
        
    }
    
    // MARK: - LimitTime CollectionView 限时抢购详情
    
    class func requestLimitTimeDetail(str: String, success: @escaping ([String], [String: String]) -> Void, error: @escaping (String) -> Void) {
        
        var images = [String]()
        var dict = [String: String]()
        Alamofire.request(str).responseJSON { (response) in
            if let json = response.result.value {
                
                let object = json as! [String: AnyObject]
                if let dictionary = object["data"] as? [String: AnyObject] {
                    
                    if dictionary["groupbuyDetail"] == nil {
                        print(object)
                        if object["message"] != nil {
                            error(object["message"] as! String)
                        }
                        return
                    }
                    let dic = dictionary["groupbuyDetail"] as! [String: AnyObject]
                    
                    images = dic["imageList"] as! [String]
                    
                    dict["productName"] = dic["productName"] as? String
                    dict["sellPriceYuan"] = "\(dic["sellPriceYuan"] as! NSNumber)"
                    dict["marketPriceYuan"] = "\(dic["marketPriceYuan"] as! NSNumber)"
                    dict["orderCount"] = "\(dic["orderCount"] as! NSNumber)"
                    
                    dict["secKillEndTime"] = dic["secKillEndTime"] as? String
                    //dict["actTheme"] = ((dic["clientProdActivityVos"] as! [[String: AnyObject]]).first! as [String: AnyObject])["actTheme"] as? String
                    dict["address"] = dic["address"] as? String
                    dict["managerRecommend"] = dic["managerRecommend"] as? String
                }
                
                success(images, dict)
                
            } else {
                //error(response.description)
                error("网络不给力，请稍后再试")
            }
        }
        
    }
    
    // MARK: -  表格分类
    
    class func requestMainType(str: String, success: @escaping ([String], [[String]]) -> Void, error: @escaping (String) -> Void) {
        
        var nameArr = [String]()
        var bodyArr = [[String]]()
        Alamofire.request(str).responseJSON { (response) in
            if let json = response.result.value {
                
                let object = json as! [String: AnyObject]
                if let array = object["datas"] as? [[String: AnyObject]] {
                    
                    for dictionary in array {
                        
                        nameArr.append(dictionary["tag_name"] as! String)
                        let arr = dictionary["infos"] as! [[String: AnyObject]]
                        
                        var model = [String]()
                        for dic in arr {
                            model.append(dic["title"] as! String)
                        }
                        
                        bodyArr.append(model)
                    }
                }
                
                success(nameArr, bodyArr)
                
            } else {
                //error(response.description)
                error("网络不给力，请稍后再试")
            }
        }
        
    }
    
    // MARK: - MainTableView 表格内容
    
    class func requestMainTable11(str: String, success: @escaping ([AttractionModel]) -> Void, error: @escaping (String) -> Void) {
        
        var muarr = [AttractionModel]()
        Alamofire.request(str).responseJSON { (response) in
            if let json = response.result.value {
                
                let object = json as! [String: AnyObject]
                if let array = object["datas"] as? [[String: AnyObject]] {
                    
                    for dictionary in array {
                        
                        let arr = dictionary["infos"] as! [[String: AnyObject]]
                        for dic in arr {
                            
                            let model = AttractionModel()
                            model.id = dic["id"] as? String
                            model.title = dic["title"] as? String
                            model.price = dic["price"] as? String
                            model.large_image = dic["large_image"] as? String
                            model.content = dic["content"] as? String
                            
                            model.object_id = dic["object_id"] as? String
                            muarr.append(model)
                            
                        }
                    }
                }
                
                success(muarr)
                
            } else {
                //error(response.description)
                error("网络不给力，请稍后再试")
            }
        }
        
    }
    
    //表格详情
    class func requestMainTable11Detail(str: String, success: @escaping ([String: String]) -> Void, error: @escaping (String) -> Void) {
        
        var dict = [String: String]()
        Alamofire.request(str).responseJSON { (response) in
            if let json = response.result.value {
                
                let object = json as! [String: AnyObject]
                if let dictionary = object["data"] as? [String: AnyObject] {
                    
                    dict["productId"] = "\(dictionary["productId"] as! NSNumber)"
                    dict["productName"] = dictionary["productName"] as? String
                    
                    dict["address"] = dictionary["address"] as? String
                    dict["openingTime"] = (dictionary["clientDestVo"] as! [String: AnyObject])["openingTime"] as? String
                    
                    dict["bizCategoryId"] = "\(dictionary["bizCategoryId"] as! NSNumber)"
                    dict["countComment"] = "\(dictionary["countComment"] as! NSNumber)"
                    
                    let arr = dictionary["clientImageBaseVos"] as! [[String: AnyObject]]
                    dict["compressPicUrl"] = arr.first!["compressPicUrl"] as? String
                }
                
                success(dict)
                
            } else {
                
                //error(response.description)
                error("网络不给力，请稍后再试")
                
            }
        }
        
    }
    
    // MARK: - 特卖
    
    class func requestSpecialSale(str: String, success: @escaping ([SpecialSaleModel]) -> Void, error: @escaping (String) -> Void) {
        //print(str)
        var muarr = [SpecialSaleModel]()
        Alamofire.request(str).responseJSON { (response) in
            if let json = response.result.value {
                
                let object = json as! [String: AnyObject]
                if let dictionary = object["data"] as? [String: AnyObject] {
                    if let arr = dictionary["groupbuyList"] as? [[String: AnyObject]] {
                        
                        for dic in arr {
                            
                            let model = SpecialSaleModel()
                            model.commentObjectId = "\(dic["commentObjectId"] as! NSNumber)"
                            model.largeImage = dic["largeImage"] as? String
                            model.discountV200 = "\(dic["discountV200"] as! NSNumber)"
                            
                            //
                            model.productName = dic["productName"] as? String
                            model.productTypeV2 = dic["productTypeV2"] as? String
                            model.departurePlace = dic["departurePlace"] as? String
                            
                            model.marketPriceYuan = "\(dic["marketPriceYuan"] as! NSNumber)"
                            model.sellPriceYuan = "\(dic["sellPriceYuan"] as! NSNumber)"
                            model.stockCount = "\(dic["stockCount"] as! NSNumber)"
                            model.recommandName = dic["recommandName"] as? String
                            
                            //
                            model.secKillEndSeconds = "\(dic["secKillEndSeconds"] as! NSNumber)"
                            model.secKillEndTime = dic["secKillEndTime"] as? String
                            model.secKillStartTime = dic["secKillStartTime"] as? String
                            model.buttonText = dic["buttonText"] as? String
                            
                            model.labelHeight = Float(model.productName!.boundingRect(with: CGSize.init(width: 400, height: 100), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 17)], context: nil).size.height) + 350
                            
                            model.productId = "\(dic["productId"] as! NSNumber)"
                            model.suppGoodsId = "\(dic["suppGoodsId"] as! NSNumber)"
                            model.branchType = dic["branchType"] as? String
                            
                            muarr.append(model)
                            
                        }
                    }
                }
                success(muarr)
                
            } else {
                //error(response.description)
                error("网络不给力，请稍后再试")
            }
        }
        
    }
    
    // MARK: - 目的地
    
    class func requestDestination(str: String, success: @escaping ([DestinationModel]) -> Void, error: @escaping (String) -> Void) {
        
        var muarr = [DestinationModel]()
        Alamofire.request(str).responseJSON { (response) in
            if let json = response.result.value {
                
                let obj = json as! [String: AnyObject]
                let arr = obj["datas"] as! [[String: AnyObject]]
                
                for dic in arr {
                    
                    let a = dic["infos"] as! [[String: AnyObject]]
                    for d in a {
                        
                        let model = DestinationModel()
                        model.id = d["id"] as? String
                        model.keyword = d["keyword"] as? String
                        model.title = d["title"] as? String
                        model.large_image = d["large_image"] as? String
                        
                        model.back_word1 = d["back_word1"] as? String
                        model.object_id = d["object_id"] as? String
                        muarr.append(model)
                        
                    }
                }
                success(muarr)
                
            } else {
                //error(response.description)
                error("网络不给力，请稍后再试")
            }
        }
        
    }
    
    class func test() {
        
        let date = Date()
        let dataformat = DateFormatter.init()
        dataformat.dateFormat = "yyyyMMddHHmmss"
        let dateString = dataformat.string(from: date as Date)
        
        let str = "http://route.showapi.com/109-35?showapi_appid=26467&showapi_sign=b080e4327208414196cbd30725db8f23&title=" + String(format: "%@&showapi_timestamp=%@","足球",dateString)
        print(str)
        
        Alamofire.request(str).responseJSON { (response) in
            if let json = response.result.value {
                
                print(json)
                
            } else {
                
                print(response.description)
                print(response.debugDescription)
                
            }
        }
    }
    
}
