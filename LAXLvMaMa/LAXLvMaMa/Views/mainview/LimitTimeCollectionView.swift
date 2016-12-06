//
//  LimitTimeCollectionView.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/13.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

//限时抢购
extension UICollectionView {
    class func getLimitTimeCollectionView() -> LimitTimeCollectionView {
        return LimitTimeCollectionView.init(CGRect.init(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: 200))
    }
}

class LimitTimeCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellId = "LimitTimeCollectionViewCell"
    var cellHeight: CGFloat = 100
    
    var dataArr = [LimitTimeModel]()
    var viewdelegate: MainViewControllerProtocol?
    
    init(_ frame: CGRect) {
        
        cellHeight = frame.size.height - 10
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
        
        super.init(frame: frame, collectionViewLayout: layout)
        
        setCollectionView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Custom Fountion
    
    func setCollectionView() {
        
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.contentInset = UIEdgeInsets.zero
        
        self.dataSource = self
        self.delegate = self
        
        self.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "aa")!)
        self.register(UINib.init(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        
        requestData()
    }
    
    func requestData() {
        let str = URL_STR_MAIN_LIMITTIME
        LAXAlamofire.requestLimitTime(str: str, success: { (arr) in
            
                self.dataArr = arr
                self.reloadData()
            
            }) { (err) in
                print(err)
                _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.requestData), userInfo: nil, repeats: false)
        }
        
    }
    
    // MARK: - CollectionViewDelegate
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! LimitTimeCollectionViewCell
        
        cell.model = dataArr[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //print(indexPath.row)
        self.viewdelegate?.didselectLimitTimeCollectionView(collectionView: collectionView, didSelectItemAt: indexPath, model: dataArr[indexPath.item])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: cellHeight / 5 * 4, height: cellHeight)
        
    }
    
}
