//
//  BaseViewController.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/23.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class BaseDetailViewController: UIViewController {
    
    var customBar: UIView!
    var leftItem: UIButton!
    var rightItem: UIButton!
    var rightItem2: UIButton!
    var titleItem: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createcustomBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.tabBarController?.tabBar.isHidden = false
    }
    
    func createcustomBar() {
        
        customBar = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 64))
        self.view.addSubview(customBar)
        
        leftItem = UIButton.init(frame: CGRect.init(x: 20, y: 20, width: 44, height: 44))//(x: 30, y: 35, width: 15, height: 20)hotelListBack
        leftItem.setBackgroundImage(UIImage.init(named: "navigationBackItem"), for: .normal)
        leftItem.addTarget(self, action: #selector(self.returnAction), for: .touchUpInside)
        customBar.addSubview(leftItem)
        
        titleItem = UILabel.init(frame: CGRect.init(x: self.view.bounds.width / 2 - 50, y: 30, width: 100, height: 21))
        customBar.addSubview(titleItem)
        
        rightItem = UIButton.init(frame: CGRect.init(x: self.view.bounds.width - 100, y: 30, width: 25, height: 25))
        rightItem.setBackgroundImage(UIImage.init(named: "routeBotCollect"), for: .normal)
        rightItem.setBackgroundImage(UIImage.init(named: "routeBotCollectSuccess"), for: .selected)
        rightItem.addTarget(self, action: #selector(self.collectAction(sender:)), for: .touchUpInside)
        customBar.addSubview(rightItem)
        
        rightItem2 = UIButton.init(frame: CGRect.init(x: self.view.bounds.width - 50, y: 25, width: 35, height: 35))
        rightItem2.setBackgroundImage(UIImage.init(named: "shareBtn"), for: .normal)
        rightItem2.addTarget(self, action: #selector(self.shareAction(sender:)), for: .touchUpInside)
        customBar.addSubview(rightItem2)
        
        self.view.bringSubview(toFront: customBar)
    }
    
    func returnAction() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func collectAction(sender: UIButton) {
        print("收藏")
        if sender.isSelected {
            
        }
        else {
            
        }
        sender.isSelected = !sender.isSelected
    }
    
    func shareAction(sender: UIButton) {
        print("分享")
    }

}
