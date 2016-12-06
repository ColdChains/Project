//
//  PageScrollController.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/16.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class PageScrollCell: UICollectionViewCell {
    var vc: UIViewController?
    var view: UIView?
}

//滑动翻页
class PageScrollController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var selectedIndex = 0
    var cellId = "PageScrollCell"
    var viewControllers: [UIViewController] = []
    
    var typeBar: TypeNavigationBar?
    
    lazy var collectionView = { () -> UICollectionView in
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        return UICollectionView(frame: CGRect(x: 0, y: 0, width: 320, height: 568), collectionViewLayout:layout)
    }()
    
    override func loadView() {
        
        super.loadView()
        
        collectionView.frame = self.view.bounds
        //collectionView.backgroundColor = UIColor.yellow
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets.zero
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        
        collectionView.register(PageScrollCell.self, forCellWithReuseIdentifier: cellId)
        self.view.addSubview(collectionView)
        self.automaticallyAdjustsScrollViewInsets = false
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor.orange
    }
    
    //将创建的滑动翻页视图添加到父视图中
    func addPageScrollViewTo(superViewController: UIViewController, superView: UIView) {
        
        //self.view.frame = superView.bounds
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        superViewController.addChildViewController(self)
        superView.addSubview(self.view)
        
    }
    
    //设置窗口大小
    func setFrame(frame: CGRect) {
        self.view.frame = frame
        collectionView.frame = self.view.bounds
        collectionView.contentOffset = CGPoint(x: collectionView.bounds.size.width * CGFloat(selectedIndex), y: collectionView.bounds.size.height)
        collectionView.reloadData()
    }
    
    //通过下标设置显示的视图
    func setSelectedViewController(selectedIndex: Int) {
        self.selectedIndex = selectedIndex
        let x = collectionView.bounds.size.width * CGFloat(selectedIndex)
        collectionView.setContentOffset(CGPoint.init(x: x, y: 0), animated: true)
    }
    
    // MARK: - Protocol Function
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewControllers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageScrollCell
        let vc = viewControllers[indexPath.item]
        vc.view.frame = self.view.bounds
        //vc.view.backgroundColor = UIColor.green
        
        cell.vc = vc
        cell.view?.removeFromSuperview()
        cell.view = vc.view
        cell.contentView.addSubview((vc.view)!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.view.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewControllers[indexPath.item].viewWillAppear(true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewControllers[indexPath.item].viewWillDisappear(true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
        self.selectedIndex = index
        typeBar?.setSegment(selectedindex: selectedIndex)
    }
    
}
