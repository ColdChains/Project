//
//  DestinationViewController.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/16.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

//目的地页面
class DestinationViewController: UIViewController, DestinationViewControllerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = PageScrollController()
        let bar = TypeNavigationBar.init(titles: ["国内", "国外", "主题"], titleFontSize: 14, frame: CGRect.init(x: 0, y: 70, width: self.view.bounds.width, height: 30))
        
        bar.pageScroll = vc
        self.view.addSubview(bar)
        //self.view.addSubview(SplitLineView.init(y: 94))
        
        vc.typeBar = bar
        vc.viewControllers = [DestinationTableViewController.init(urlStr: URL_STR_DESTINATION_ONE, delegate: self), DestinationTableViewController.init(urlStr: URL_STR_DESTINATION_TWO, delegate: self), DestinationTableViewController.init(urlStr: URL_STR_DESTINATION_THREE, delegate: self)]
        vc.addPageScrollViewTo(superViewController: self, superView: self.view)
        vc.setFrame(frame: CGRect.init(x: 0, y: 101, width: self.view.bounds.width, height: self.view.bounds.height - 95))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func showView() {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.green
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.navigationBar.isHidden = false
        self.show(vc, sender: nil)
    }
    
    func didselectDestinationTableView(tableView: UITableView, didSelectRowAt indexPath: IndexPath, model: DestinationModel) {
        print("目的地", indexPath.row)
        let vc = DestinationDetailViewController()
        vc.model = model
        self.show(vc, sender: nil)
    }

}
