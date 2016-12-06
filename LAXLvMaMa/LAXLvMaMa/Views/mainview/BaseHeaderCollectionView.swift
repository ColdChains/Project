//
//  BaseHeaderCollectionView.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/17.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

extension UIView {
    func getBaseHeaderCollectionView() -> BaseHeaderCollectionView {
        return BaseHeaderCollectionView.init(line: 2, rank: 2, frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 140))
    }
}

//表头的集合视图
class BaseHeaderCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var i: CGFloat = 2
    var j: CGFloat = 2
    var space: CGFloat = 5
    
    var cellId = "HeaderCollectionViewCell"
    var dataArr: [String] = []
    
    var viewdelegate: MainViewControllerProtocol?
    
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
        for _ in 1...Int(i * j) {
            dataArr.append("a")
        }
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
        for _ in 1...Int(i * j) {
            dataArr.append("a")
        }
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HeaderCollectionViewCell
        cell.imgView.image = UIImage.init(named: dataArr[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //print(indexPath.item)
        //self.viewdelegate?.didselectHeaderCollectionView(collectionView: collectionView, didSelectItemAt: indexPath, model: dataArr[indexPath.item])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (bounds.width - space) / j - space
        let height = (bounds.height - space) / i - space
        return CGSize.init(width: width, height: height)////
        
    }

}
