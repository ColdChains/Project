//
//  TableViewDetailViewController.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/23.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class AttractionDetailViewController: BaseDetailViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var headerView: MainDetailTableHeaderView!
    
    var dataDic = [String: String]()
    var model: AttractionModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView.init(frame: self.view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        self.view.sendSubview(toBack: tableView)
        self.titleItem.text = "景点详情"
        self.titleItem.isHidden = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView.init()
        headerView = MainDetailTableHeaderView.init(f: CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: 200))
        tableView.tableHeaderView = headerView
        
        requestData()
        setButtonState()
    }
    
    func setButtonState() {
        if model != nil {
            if LAXDataBaseOperation.selectOneAttractionEntity(model: model!) {
                rightItem.isSelected = true
            }
        }
    }
    
    func requestData() {
        if let id = model?.object_id {
            
            let str = String.init(format: URL_STR_MAIN_TABLE_1_1_DETAIL, id)
            LAXAlamofire.requestMainTable11Detail(str: str, success: { (dic) in
                
                self.dataDic = dic
                self.headerView.title.text = self.dataDic["productName"]
                self.headerView.comment.text = self.dataDic["countComment"]! + "条点评"
                self.headerView.count.text = self.dataDic["bizCategoryId"]! + "张"
                
                self.headerView.imageView.af_setImage(withURL: URL.init(string: self.dataDic["compressPicUrl"]!)!, placeholderImage: UIImage.init(named: "a"), filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.crossDissolve(0.5), runImageTransitionIfCached: true, completion: nil)
                
                self.tableView.reloadData()
                
            }) { (err) in
                print(err)
                self.view.addSubview(UILabel.defaultAlertLabel(message: err))
            }
        
        }
    }
    
    // MARK: - Protocol Function
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
                cell.textLabel?.text = dataDic["address"]
            }
            else if indexPath.row == 1 {
                cell.textLabel?.text = dataDic["openingTime"]
            }
            else if indexPath.row == 2 {
                cell.textLabel?.text = "保证入园"
                cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 40
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let bar = TypeNavigationBar.init(titles: ["订票", "景点介绍", "点评", "景+酒"], titleFontSize: 15, frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: 40))
        return bar
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        customBar.backgroundColor = UIColor.init(white: 1, alpha: (scrollView.contentOffset.y - 150) / 50.0)
        titleItem.isHidden = scrollView.contentOffset.y < 200 ? true : false
    }
    
    override func collectAction(sender: UIButton) {
        print("收藏")
        if model == nil {
            self.view.addSubview(UILabel.defaultAlertLabelAtDown(message: "找不到内容，请稍后再试"))
            return
        }
        if sender.isSelected {
            LAXDataBaseOperation.deleteAttractionEntity(model: model!)
            self.view.addSubview(UILabel.defaultAlertLabelAtDown(message: "取消收藏成功"))
        }
        else {
            LAXDataBaseOperation.insertAttractionEntity(model: model!)
            self.view.addSubview(UILabel.defaultAlertLabelAtDown(message: "收藏成功"))
        }
        sender.isSelected = !sender.isSelected
    }
    
    override func shareAction(sender: UIButton) {
        
        print("分享")
        
        shareAction()
        
    }
    
    func shareAction (){
        
        
    }
    
}
