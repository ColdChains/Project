//
//  AutoPlayView.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/15.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

//轮播图
extension UIView {
    class func getAutoPlayView() -> AutoPlayView {
        return AutoPlayView.init(CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 100))
    }
}

class AutoPlayView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var width = UIScreen.main.bounds.size.width
    var height: CGFloat = 200
    var cellId = "AutoPlayCollectionViewCell"
    var urlStr = URL_STR_MAIN_AUTOPLAY
    
    var dataArr: [String] = []
    var nameArr: [String] = []
    var imageArr: [UIImage] = []
    
    var collectionView: UICollectionView!
    var label: UILabel!
    var page: UIPageControl!
    
    var timer: Timer!
    var viewdelegate: MainViewControllerProtocol?
    
    init(_ frame: CGRect) {
        
        super.init(frame: frame)
        
        self.width = frame.size.width
        self.height = frame.size.height
        
        //self.backgroundColor = UIColor.lightGray
        createAutoPlayView()
        requestData()
        
    }
    
    init(images: [String], frame: CGRect) {
        
        super.init(frame: frame)
        
        self.width = frame.size.width
        self.height = frame.size.height
        //self.backgroundColor = UIColor.lightGray
        
        dataArr = images
        createAutoPlayView()
        collectionView.reloadData()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Create AutoPlayView
    
    func createAutoPlayView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        let frame = CGRect.init(x: 0, y: 0, width: width, height: height)
        collectionView = UICollectionView.init(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "aa")!)
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets.zero
        
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib.init(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        self.addSubview(collectionView)
        
    }
    
    func requestData() {
        //let urlStr = URL_STR_MAIN_AUTOPLAY
        LAXAlamofire.requestAotoPlay(str: urlStr, success: { (arr, name) in
            
                if arr.count == 0 || name.count == 0 {
                    return
                }
                
                self.dataArr = arr
                self.dataArr.append(arr.first!)
                self.nameArr = name
                self.nameArr.append(name.first!)
                
                self.collectionView.reloadData()
                self.createTimer()
            
                if self.page == nil {
                    self.addPage()
                }
                //self.addTitleLabel()
            
            }) { (err) in
                print(err)
                _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.requestData), userInfo: nil, repeats: false)
        }
        
    }
    
    func getDataFromDataBase() {
//        imageArr = LAXDataBaseOperation.selectAllImageAutoPlayEntity()
//        dataArr = LAXDataBaseOperation.selectAllUrlAutoPlayEntity()
//        nameArr = LAXDataBaseOperation.selectAllNameAutoPlayEntity()
//        collectionView.reloadData()
//        createTimer()
    }
    
    func saveDataToDataBase() {
        
    }
    
    func addPage() {
        
        page = UIPageControl.init()
        page.frame = CGRect.init(x: (width - 100) / 2, y: height - 20, width: 100, height: 20)
        page.currentPageIndicatorTintColor = UIColor.white
        page.pageIndicatorTintColor = UIColor.lightText
        page.numberOfPages = dataArr.count - 1
        page.currentPage = 0
        self.addSubview(page)
        
    }
    
    func addTitleLabel() {
        
        let backView = UIView.init(frame: CGRect.init(x: 0, y: height - 20, width: width, height: 20))
        backView.backgroundColor = UIColor.black
        backView.alpha = 0.4
        self.addSubview(backView)
        
        label = UILabel.init()
        label.frame = CGRect.init(x: 10, y: height - 20, width: (width - 120) / 2, height: 20)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = nameArr[0]
        self.addSubview(label)
        
    }
    
    func createTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: .commonModes)
    }
    
    func stopTimer() {
        if timer != nil {
            timer.invalidate()
            timer = nil
        }
    }
    
    func onTimer(timer: Timer) {
        
        setContentOffset()
        collectionView.setContentOffset(CGPoint.init(x: collectionView.contentOffset.x + width, y: 0), animated: true)
        setContentOffset()
        
    }
    
    func setContentOffset() {
        if collectionView.contentOffset.x >= CGFloat(dataArr.count - 1) * width {
            collectionView.contentOffset = CGPoint.init(x: 0, y: 0)
        }
        
        setCurrentPage()
    }
    
    func setCurrentPage() {
        let n = (collectionView.contentOffset.x + width / 2) / width
        page.currentPage = Int(n) % (nameArr.count - 1)
        //label.text = nameArr[page.currentPage]
    }
    
    // MARK: - Protocol Function
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AutoPlayCollectionViewCell
        
        //cell.imgView.image = UIImage.init(named: "a")
        cell.imgView.af_setImage(withURL: URL.init(string: dataArr[indexPath.row])!, placeholderImage: UIImage.init(named: "a"), filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.crossDissolve(0), runImageTransitionIfCached: true, completion: nil)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print(indexPath.row)
        stopTimer()
        self.viewdelegate?.didselectAutoPlayView(collectionView: collectionView, didSelectItemAt: indexPath, name: nameArr[indexPath.item])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: UIScreen.main.bounds.size.width, height: height)////
    }
    
    // MARK: - Scroll Protocol
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setContentOffset()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        timer.invalidate()
        setCurrentPage()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        createTimer()
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        //print("starting")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //print("ending")
    }
    
}

