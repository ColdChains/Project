//
//  AutoPlayViewVertical.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/17.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

//轮播图竖向
extension UIView {
    class func getAutoPlayViewVertical() -> AutoPlayView {
        return AutoPlayView.init(CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 20))
    }
}

class AutoPlayViewVertical: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var width = UIScreen.main.bounds.size.width
    var height: CGFloat = 20
    var cellId = "AutoPlayVerticalCollectionViewCell"
    //var urlStr = ""
    
    var dataArr: [String] = ["活动", "hot", "活动"]
    var dataArr2: [String] = ["写点评， 免费送奖金和实物", "领888元新手红包，秋高去爽", "写点评， 免费送奖金和实物"]
    
    var collectionView: UICollectionView!
    
    var timer: Timer!
    var viewdelegate: MainViewControllerProtocol?
    
    init(_ frame: CGRect) {//, urlStr: String
        
        //self.urlStr = urlStr
        super.init(frame: frame)
        
        self.width = frame.size.width
        self.height = frame.size.height
        
        createAutoPlayView()
        self.backgroundColor = UIColor.init(white: 0.9, alpha: 1)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Create AutoPlayView
    
    func createAutoPlayView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        let frame = CGRect.init(x: 0, y: 0, width: width, height: height)
        collectionView = UICollectionView.init(frame: frame, collectionViewLayout: layout)
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets.zero
        
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.register(UINib.init(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        self.addSubview(collectionView)
        
        requestData()
    }
    
    func requestData() {
        
        //let urlStr = URL_STR_MAIN_AUTOPLAY
        createTimer()
        
    }
    
    
    func createTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: RunLoopMode.commonModes)
    }
    
    func stopTimer() {
        if timer != nil {
            timer.invalidate()
            timer = nil
        }
    }
    
    func onTimer(timer: Timer) {
        collectionView.setContentOffset(CGPoint.init(x: 0, y: collectionView.contentOffset.y + height), animated: true)
        setContentOffset()
    }
    
    func setContentOffset() {
        if collectionView.contentOffset.y >= CGFloat(dataArr.count - 1) * height {
            collectionView.contentOffset = CGPoint.init(x: 0, y: 0)
        }
    }
    
    // MARK: - Protocol Function
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AutoPlayVerticalCollectionViewCell
        
        cell.label1.text = dataArr[indexPath.item]
        cell.label2.text = dataArr2[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //print(indexPath.row)
        stopTimer()
        self.viewdelegate?.didselectAutoPlayViewVertical(collectionView: collectionView, didSelectItemAt: indexPath, model: dataArr[indexPath.item])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: width, height: height)////
    }
    
}
