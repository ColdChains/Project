//
//  SpecialSaleTableView.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/18.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class SpecialSaleTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var page = 0
    var urlStr = URL_STR_SPECIALSALE_ONE
    
    var cellId = "SpecialSaleTableViewCell"
    var dataArr = [SpecialSaleModel]()
    
    var viewdelegate: SpecialSaleViewControllerProtocol?
    
    init(urlStr: String, frame: CGRect) {
        self.urlStr = urlStr
        
        super.init(frame: frame, style: .plain)
        self.dataSource = self
        self.delegate = self
        
        self.tableFooterView = UIView.init(frame: CGRect.init())
        self.register(UINib.init(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        
        self.createLoading()
        self.createRefreshing()
        self.mj_footer.beginRefreshing()
        //self.loadData()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //刷新数据
    func refreshData() {
        requestData(next: false)
    }
    
    //加载下一页
    func loadData() {
        page += 1
        requestData(next: true)
    }
    
    var bubble: LKBubbleView?
    var alertLabel: UILabel?
    
    func requestData(next: Bool) {
        
        if alertLabel != nil {
            alertLabel?.removeFromSuperview()
            alertLabel = nil
        }
        //self.showRoundProgressWithTitle(title: "Loading...")
        self.bubble = LKBubbleView.laxShowRoundProgress()
        
        let str = String.init(format: urlStr, page)
        LAXAlamofire.requestSpecialSale(str: str, success: { (arr) in
            
            self.bubble?.hide()
            
                if self.page == 1 {
                    self.dataArr = arr
                    self.dataArr.remove(at: 0)
                    self.dataArr.remove(at: 0)
                } else {
                    self.dataArr += arr
                }
                self.reloadData()
                
                self.mj_footer.endRefreshing()
                self.mj_header.endRefreshing()
            
            }) { (err) in
                
                //self.showErrorWithTitle(title: "无网络连接", autoCloseTime: 2)
                self.bubble?.hide()
                
                self.addSubview(UILabel.defaultAlertLabel(message: err))
                
                print(err)
                self.mj_footer.endRefreshing()
                self.mj_header.endRefreshing()
                //_ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.requestData), userInfo: nil, repeats: false)
        }
        
    }
    
    //    上拉加载
    func createLoading() {
        self.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {
            self.loadData()
        })
    }
    
    //    下拉刷新
    func createRefreshing() {
        self.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.refreshData()
        })
    }
    
    // MARK: - Protocol Foundtion
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! SpecialSaleTableViewCell
        cell.selectionStyle = .none
        cell.model = dataArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        self.viewdelegate?.didselectSpecialSaleTableView(tableView: tableView, didSelectRowAt: indexPath, model: dataArr[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(dataArr[indexPath.row].labelHeight!)
    }
    
}
