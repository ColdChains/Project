//
//  SearchTableViewController.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/21.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    var dataArr: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        //self.hidesBottomBarWhenPushed = false
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.tabBarController?.tabBar.isHidden = true
        
        self.tableView.tableFooterView = UIView.init(frame: CGRect.init())
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        createItems()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.tabBarController?.tabBar.isHidden = false
    }

    func createItems() {
        
        let search = UISearchBar.init()
        search.becomeFirstResponder()
        search.showsSearchResultsButton = true
        search.placeholder = "请输入搜索内容"
        search.delegate = self
        self.navigationItem.titleView = search
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = dataArr[indexPath.row]
        
        return cell
    }
    
    // MARK: - SearchBar
    
    //已经开始编辑时的回调
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("start edit")
    }
    
    //已经结束编辑的回调
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("end edit")
    }
    
    //编辑文字改变的回调
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("edit")
    }
    
    //搜索按钮点击的回调
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search")
        dataArr.append("haha")
        tableView.reloadData()
    }
    
    //取消按钮点击的回调
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancle")
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    //搜索结果按钮点击的回调
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        print("result")
    }
    

}
