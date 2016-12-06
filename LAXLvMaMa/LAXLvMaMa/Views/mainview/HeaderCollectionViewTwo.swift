//
//  HeaderCollectionViewTwo.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/17.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class HeaderCollectionViewTwo: BaseHeaderCollectionView {

    init(_ frame: CGRect) {
        super.init(line: 2, rank: 4, frame: frame)
        reloadCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadCollectionView() {
        
        dataArr = []
        for  i in 1...7 {
            dataArr.append("indexSASearchIcon\(i)")
        }
        dataArr.append("moreSATag")
        self.reloadData()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //print(indexPath.item)
        self.viewdelegate?.didselectHeaderCollectionViewTwo(collectionView: collectionView, didSelectItemAt: indexPath, model: dataArr[indexPath.item])
        
    }

}
