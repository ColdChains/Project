//
//  MainViewControllerProtocol.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/18.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import Foundation
import UIKit

protocol MainViewControllerProtocol {
    
    //横向轮播图
    func didselectAutoPlayView(collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, name: String)
    //纵向轮播图
    func didselectAutoPlayViewVertical(collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, model: String)
    
    //表头集合视图
    //func didselectHeaderCollectionView(collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, model: String)
    func didselectHeaderCollectionViewOne(collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, model: String)
    func didselectHeaderCollectionViewTwo(collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, model: String)
    
    //热门推荐
    func didselectHotRecommondView(didSelectItemAt indexPath: Int, model: AttractionModel)
    
    //手机专享
    func didselectPhoneEnjoyView(didSelectItemAt indexPath: Int, model: String)
    
    //限时抢购
    func didselectLimitTimeCollectionView(collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, model: LimitTimeModel)
    
    //表格视图
    func didselectMainTableView(tableView: UITableView, didSelectRowAt indexPath: IndexPath, model: AttractionModel)
//    func heightForFooterView(height: CGFloat)
    func scrollViewDidScrollMainTableView(_ scrollView: UIScrollView)
    
}
