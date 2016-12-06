//
//  ScenicSpotTableViewController.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/24.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class ScenicSpotTableViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var pageSize = 0
    var cellId = "ScenicSpotTableViewCell"
    var tableView: UITableView!
    var dataArr = [ScenicSpotModel]()
    
    var search: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView.init(frame: self.view.frame)
        tableView.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        tableView.register(UINib.init(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView.init()
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.addSubview(tableView)
        self.view.sendSubview(toBack: tableView)
        
        createLoading()
        createRefreshing()
        loadData()
        
        search = UISearchBar.init(frame: CGRect.init(x: 70, y: 30, width: self.view.frame.width - 170, height: 30))
        //search.barTintColor = UIColor.clear
        //search.backgroundColor = UIColor.clear
        search.searchBarStyle = .minimal
        search.placeholder = "景点名称/城市/主题"
        self.navigationItem.titleView = search
    }
    
    //刷新数据
    func refreshData() {
        requestData()
    }
    
    //加载下一页
    func loadData() {
        pageSize += 7
        requestData()
    }
    
    func requestData() {
        let str = String.init(format: URL_STR_MAIN_COLLECTIONVIEWOne_DETAIL_1, pageSize)
        LAXAlamofire.requestScenicSpotDetail(str: str, success: { (arr) in
            
            self.dataArr = arr
            self.tableView.reloadData()
            self.tableView.mj_footer.endRefreshing()
            self.tableView.mj_header.endRefreshing()
            
            }) { (err) in
                print(err)
                self.view.addSubview(UILabel.defaultAlertLabel(message: err))
                self.tableView.mj_footer.endRefreshing()
                self.tableView.mj_header.endRefreshing()
        }
    }
    
    //    上拉加载
    func createLoading() {
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {
            self.tableView.mj_footer.endRefreshing()
            self.loadData()
        })
    }
    
    //    下拉刷新
    func createRefreshing() {
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.refreshData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArr.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ScenicSpotTableViewCell
        
        cell.selectionStyle = .none
        cell.model = dataArr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AttractionDetailViewController()
        vc.model = AttractionModel()
        vc.model?.object_id = dataArr[indexPath.row].productId
        vc.model?.title = dataArr[indexPath.row].name
        self.show(vc, sender: nil)
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        customBar.backgroundColor = UIColor.init(white: 1, alpha: (scrollView.contentOffset.y - 150) / 50.0)
//        search.isHidden = scrollView.contentOffset.y < 200 ? true : false
//    }
    
}
