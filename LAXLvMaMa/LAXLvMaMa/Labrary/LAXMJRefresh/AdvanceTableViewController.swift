//
//  AdvanceTableViewController.swift
//  LAX_bLoveLimitFree
//
//  Created by 冰凉的枷锁 on 16/9/13.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//
/*
import UIKit

class AdvanceTableViewController: BaseTableViewController, LAXConnectionDataDelegate {
    
    var n = 0
    var urlStr: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func initView(str: String) {
        urlStr = str
        loadRequest()
        createRefreshing()
        createLoading()
    }
    
    func loadRequest() {
        
        n += 1
        let url = String.init(format: urlStr!, n)
        let conn = LAXURLConnection()
        conn.delegate = self
        conn.startConnection(url)
        
    }
    
    func refreshData() {
        let url = String.init(format: urlStr!, n)
        let conn = LAXURLConnection()
        conn.delegate = self
        conn.startConnection(url)
    }
    
    //    代理
    func didReceiveData(obj: NSDictionary) {
        
        let arr = obj.objectForKey("applications") as! NSArray
        for dict in arr {
            let model = LimitModel()
            model.setValuesForKeysWithDictionary(dict as! [String: AnyObject])
            muArr.append(model)
        }
        tableView.reloadData()
        
        //        停止上拉加载
        tableView.mj_footer.endRefreshing()
        //        停止下拉刷新
        tableView.mj_header.endRefreshing()
    }
    
    //    上拉加载
    func createLoading() {
        
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {
            
            self.tableView.mj_footer.endRefreshing()
            
            //            加载下一页数据
            self.loadRequest()
            
        })
    }
    
    //    下拉刷新
    func createRefreshing() {
        
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.refreshData()
        })
        
        
    }
    
}*/