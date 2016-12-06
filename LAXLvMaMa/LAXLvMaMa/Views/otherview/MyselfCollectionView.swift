//
//  MyselfCollectionView.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/20.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class MyselfCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var i: CGFloat = 1
    var j: CGFloat = 4
    var space: CGFloat = 5
    
    var cellId = "MyselfCollectionViewCell"
    var dataArr: [String] = ["电子票", "优惠券", "钱包", "积分"]
    var nameArr: [String] = ["dianzipiao", "youhuiquan", "wodeqianbao", "jifen"]
    
    var viewdelegate: MyselfViewControllerProtocol?
    
    init(line: CGFloat, rank: CGFloat, frame: CGRect) {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
        
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.dataSource = self
        self.delegate = self
        self.backgroundColor = UIColor.clear
        self.register(UINib.init(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        
        i = line
        j = rank
        self.reloadData()
        
    }
    
    init(line: CGFloat, rank: CGFloat, space: CGFloat, frame: CGRect) {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = space
        layout.minimumLineSpacing = space
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsetsMake(space, space, space, space)
        
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.dataSource = self
        self.delegate = self
        self.backgroundColor = UIColor.clear
        self.register(UINib.init(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        
        i = line
        j = rank
        self.space = space
        self.reloadData()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Protocol Function
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyselfCollectionViewCell
        
        cell.imgView.image = UIImage.init(named: nameArr[indexPath.row])
        cell.textLabel.text = dataArr[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //print(indexPath.item)
        self.viewdelegate?.didselectMyselfCollectionView(collectionView: collectionView, didSelectItemAt: indexPath, model: dataArr[indexPath.item])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (bounds.width - space) / j - space
        let height = (bounds.height - space) / i - space
        return CGSize.init(width: width, height: height)////
        
    }
    
}
