//
//  SpecialSaleViewController.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/16.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

//特卖页面
class SpecialSaleViewController: UIViewController, SpecialSaleViewControllerProtocol {

    @IBOutlet weak var barView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = PageScrollController()
        let bar = TypeNavigationBar.init(titles: ["周爆款","限时抢","清仓价"], titleFontSize: 20, frame: CGRect.init(x: 0, y: 30, width: self.view.bounds.width / 3 * 2, height: 34))
        
        bar.pageScroll = vc
        self.view.addSubview(bar)
        self.view.addSubview(SplitLineView.init(y: 64))
        
        vc.setFrame(frame: CGRect.init(x: 0, y: 65, width: self.view.bounds.width, height: self.view.bounds.height - 65))
        vc.viewControllers = [SpecialSaleBaseViewController.init(urlStr: URL_STR_SPECIALSALE_ONE, delegate: self), SpecialSaleBaseViewController.init(urlStr: URL_STR_SPECIALSALE_TWO, delegate: self), SpecialSaleBaseViewController.init(urlStr: URL_STR_SPECIALSALE_THREE, delegate: self)]
        vc.typeBar = bar
        vc.addPageScrollViewTo(superViewController: self, superView: self.view)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func didselectSpecialSaleTableView(tableView: UITableView, didSelectRowAt indexPath: IndexPath, model: SpecialSaleModel) {
        print("特卖", indexPath.row)
        let vc = LimitTimeTableViewController()
        vc.model = LimitTimeModel()
        vc.model?.productId = model.productId
        vc.model?.suppGoodsId = model.suppGoodsId
        vc.model?.branchType = model.branchType
        self.show(vc, sender: nil)
    }
    
    @IBAction func cityButtonAction(_ sender: UIButton) {
        let vc = CityListTableViewController()
        self.show(vc, sender: sender)
    }
    
}
