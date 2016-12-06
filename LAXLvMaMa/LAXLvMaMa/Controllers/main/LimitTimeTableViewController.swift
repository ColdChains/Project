//
//  LimitTimeTableViewController.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/26.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class LimitTimeTableViewController: BaseDetailViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var header: UIView!
    var headerView: LimitTimeDetailHeaderView!
    
    var images = [String]()
    var dataDic = [String: String]()
    var model: LimitTimeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView.init(frame: self.view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        self.view.sendSubview(toBack: tableView)
        self.titleItem.text = "秒杀详情"
        self.titleItem.isHidden = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView.init()
        
        header = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: 280))
        
        headerView = LimitTimeDetailHeaderView.init(f: CGRect.init(x: 0, y: 200, width: self.view.bounds.width, height: 80))
        header.addSubview(headerView)
        tableView.tableHeaderView = header
        
        requestData()
    }
    
    func requestData() {
        if model?.productId != nil && model?.suppGoodsId != nil && model?.branchType != nil {
            
            let str = String.init(format: URL_STR_MAIN_LIMITTIME_DETAIL, model!.productId!, model!.suppGoodsId!, model!.branchType!)
            print(str)
            LAXAlamofire.requestLimitTimeDetail(str: str, success: { (images, dic) in
                
                let auto = AutoPlayView.init(images: images, frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: 200))
                self.header.addSubview(auto)
                
                self.images = images
                self.dataDic = dic
                self.headerView.title.text = self.dataDic["productName"]
                self.headerView.sellPriceYuanLabel.text = "¥" + self.dataDic["sellPriceYuan"]! + "起"
                self.headerView.orderCountLabel.text = self.dataDic["orderCount"]! + "人已购买"
                
                self.tableView.reloadData()
                
            }) { (err) in
                print(err)
                self.view.addSubview(UILabel.defaultAlertLabel(message: err))
            }
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if dataDic.count == 0 {
            return 0
        }
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataDic.count == 0 {
            return 0
        }
        
        if section == 0 {
            return 3
        }
        else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        
        if indexPath.section == 0 {
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
            cell.accessoryType = .disclosureIndicator
            
            if indexPath.row == 0 {
                cell.textLabel?.text = dataDic["actTheme"]
            }
            else if indexPath.row == 1 {
                cell.textLabel?.text = dataDic["address"]
            }
            else if indexPath.row == 2 {
                cell.textLabel?.text = dataDic["managerRecommend"]
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if dataDic.count == 0 {
            return 0
        }
        
        if indexPath.row == 2 && indexPath.section == 0 {
            return 66
        }
        else {
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if dataDic.count == 0 {
            return 0
        }
        
        if section == 1 {
            return 40
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let bar = TypeNavigationBar.init(titles: ["特色", "须知", "费用", "点评"], titleFontSize: 15, frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: 40))
        return bar
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        customBar.backgroundColor = UIColor.init(white: 1, alpha: (scrollView.contentOffset.y - 150) / 50.0)
        titleItem.isHidden = scrollView.contentOffset.y < 200 ? true : false
    }
    
    override func shareAction(sender: UIButton) {
        
        print("分享")
        
        shareAction()
        
    }
    
    func shareAction (){
        
       
    }
    
}
