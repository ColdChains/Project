//
//  CityListTableViewController.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/20.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class CityListTableViewController: UITableViewController {
    
    var dataArr: [CityList] = []
    
    var cityArr: [String] = []
    var cityDic: [String: [CityList]] = [:]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.tabBarController?.tabBar.isHidden = true
        
        self.tableView.tableFooterView = UIView.init(frame: CGRect.init())
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        createItems()
        createRefreshing()
        requestData()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.tabBarController?.tabBar.isHidden = false
    }
    
    func createItems() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "返回", style: .plain, target: self, action: #selector(self.returnAction))
        
        let search = UISearchBar.init()
        search.placeholder = "出发城市"
        search.becomeFirstResponder()
        //search.showsCancelButton = true
        self.navigationItem.titleView = search
        
    }
    
    func returnAction() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func requestData() {
        let str = URL_STR_CITYLIST
        LAXAlamofire.requestCityList(str: str, success: { (arr) in
            
                self.dataArr = arr
                self.anaylize()
                //print(self.dataArr)
                self.tableView.reloadData()
                self.tableView.mj_header.endRefreshing()
            
            }) { (err) in
                print(err)
                self.view.addSubview(UILabel.defaultAlertLabel(message: err))
                self.tableView.mj_header.endRefreshing()
                //_ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.requestData), userInfo: nil, repeats: false)
        }
        
    }
    
    //    下拉刷新
    func createRefreshing() {
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.requestData()
        })
    }
    
    func anaylize() {
        for model in dataArr {
            
            let first = "\((model.pinyin?.characters.first)!)"
            if self.cityDic[first] != nil {
                self.cityDic[first]?.append(model)
            }
            else {
                self.cityArr.append(first)
                self.cityDic[first] = [model]
            }
        }
        //print(cityArr)
    }
    
//    func getKey(section: Int) -> String {
//        return String.init(format: "%d", 97 + section)
//    }
//    
//    func sortArr( arr: inout [CityList]) -> [CityList] {
//        var arr1: [CityList] = arr
//        for i in 0...arr.count - 1 {
//            for j in 0...i {
//                if arr1[j].pinyin! > arr1[j + 1].pinyin! {
//                    let tmp = arr1[j]
//                    arr1[j] = arr1[j+1]
//                    arr[j+1] = tmp
//                }
//            }
//        }
//        print(arr1)
//        return arr1
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return cityArr.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cityDic[cityArr[section]] != nil {
            return cityDic[cityArr[section]]!.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = cityDic[cityArr[indexPath.section]]?[indexPath.row].name
        
        //cell.textLabel?.text = dataArr[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel.init(frame: CGRect.init(x: 10, y: 0, width: 0, height: 20))
        label.backgroundColor = UIColor.init(white: 0.90, alpha: 1)
        label.text = cityArr[section]
        return label
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        let page = IndexPath.init(row: 0, section: index)
        tableView.scrollToRow(at: page, at: .top, animated: true)
        return cityArr.count
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return cityArr
    }
    
}
