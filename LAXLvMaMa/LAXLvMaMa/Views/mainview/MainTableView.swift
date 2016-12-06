//
//  MainTableView.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/26.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class MainTableView: UITableView, UITableViewDataSource, UITableViewDelegate, MenuBarDelegate {

    var location = 0
    var subLocation = 0
    var pageSize = 0
    
    var channelCode = ["NSY", "NSYFL", "NSYFL", "NSYFL"]
    var tagCodes = ["NSY_JDMP", "NSYFL_JDMP3", "NSYFL_JDMP2", "NSYFL_JDMP1", "NSY_ZBY", "NSYFL_ZBY3", "NSYFL_ZBY2", "NSYFL_ZBY1", "NSY_GNY", "NSYFL_GNY3", "NSYFL_GNY2", "NSYFL_GNY1", "NSY_CJY", "NSYFL_CJY3", "NSYFL_CJY2", "NSYFL_CJY1"]
    
    var titles: [String] = []//"景点门票","周边游","国内游", "出境游"
    var subTitles = [[String]]()
    
    var cellId = "AttractionTableViewCell"
    var dataArr = [AttractionModel]()
    
    var sectionView: UIView!
    var subMenuView: MenuBar?
    var headerView: HeaderTableView!
    var viewdelegate: MainViewControllerProtocol?
    
    init(delegate: MainViewControllerProtocol, frame: CGRect, urlInfo: [String]?) {
        
        self.viewdelegate = delegate
        super.init(frame: frame, style: .plain)
        
        self.dataSource = self
        self.delegate = self
        self.backgroundColor = UIColor.clear
        self.register(UINib.init(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        
        headerView = HeaderTableView.init(delegate: delegate)
        self.tableHeaderView = headerView
        
        createLoading()
        createRefreshing()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //创建组头
    func createView() {
        
        sectionView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.bounds.width, height: 60))
        let upView = MenuBar.init(titles: titles, titleFontSize: 17, titleWidth: self.bounds.width, frame: CGRect.init(x: 0, y: 0, width: self.bounds.width, height: 50))
        upView.viewDelegate = self
        upView.segment.tag = 10
        upView.backgroundColor = UIColor.init(white: 0.9, alpha: 1)
        sectionView.addSubview(upView)
        
        subMenuView = MenuBar.init(titles: subTitles[location], titleFontSize: 14, titleWidth: self.bounds.width - 20, frame: CGRect.init(x: 0, y: 50, width: self.bounds.width, height: 40))
        subMenuView?.viewDelegate = self
        subMenuView?.segment.tag = 11
        subMenuView?.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        sectionView.addSubview(subMenuView!)
        
    }
    
    func refreshData() {
        headerView.refreshDatas()
        requestData()
    }
    
    func loadData() {
        requestType()
        pageSize += 5
        requestData()
    }
    
    func requestType() {
        let str = URL_STR_MAIN_TYPE
        LAXAlamofire.requestMainType(str: str, success: { (name, body) in
            
            self.titles = name
            self.subTitles = body
            
            for i in 0..<self.titles.count {
                self.titles[i] = self.titles[i].substring(to: self.titles[i].index(before: self.titles[i].index(before: self.titles[i].index(before: self.titles[i].index(before: self.titles[i].endIndex)))))
            }
            
            if self.sectionView == nil {
                self.createView()
            }
            self.reloadData()
            
        }) { (err) in
            print(err)
            _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.requestType), userInfo: nil, repeats: false)
        }
    }
    
    func requestData() {
        print(channelCode[subLocation], tagCodes[location * 4 + subLocation])
        let str = String.init(format: URL_STR_MAIN_TABLE, pageSize, channelCode[subLocation], tagCodes[location * 4 + subLocation])
        LAXAlamofire.requestMainTable11(str: str, success: { (arr) in
            
            self.dataArr = arr
            self.reloadData()
            
            self.mj_footer.endRefreshing()
            self.mj_header.endRefreshing()
            
        }) { (err) in
            print(err)
            self.mj_footer.endRefreshing()
            self.mj_header.endRefreshing()
            _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.requestData), userInfo: nil, repeats: false)
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
        return titles.count == 0 ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! AttractionTableViewCell
        cell.model = dataArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(1, indexPath.row)
        self.viewdelegate?.didselectMainTableView(tableView: tableView, didSelectRowAt: indexPath, model: dataArr[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return sectionView
        
    }
    
    var offsetY: CGFloat = 0
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < headerView.headerHeight - 64 + 30 ? false : (scrollView.contentOffset.y < offsetY ? false : true) {
            hideSubMenuView()
        } else {
            showSubMenuView()
        }
        
        //subMenuView?.isHidden = scrollView.contentOffset.y < headerView.headerHeight - 64 + 30 ? false : (scrollView.contentOffset.y < offsetY ? false : true)
        offsetY = scrollView.contentOffset.y
        self.viewdelegate?.scrollViewDidScrollMainTableView(scrollView)
    }
    
    //
    func showSubMenuView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.subMenuView?.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
            }) { (b) in
                if b {
                    self.subMenuView?.isHidden = false
                }
        }
    }
    func hideSubMenuView() {
        UIView.animate(withDuration: 0.5, animations: {
            self.subMenuView?.backgroundColor = UIColor.init(white: 0.95, alpha: 0.2)
        }) { (b) in
            if b {
                self.subMenuView?.isHidden = true
            }
        }
    }
    //
    
    //组头菜单代理
    func didSelectedMenuBar(sender: UISegmentedControl, selectedIndex: Int) {
        
        if sender.tag == 10 {
            location = selectedIndex
            subMenuView?.setSegmentTitle(titles: subTitles[location])
            subLocation = 0
        }
        else {
            subLocation = selectedIndex
        }
        pageSize = 0
        loadData()
        
    }
    
}
